require 'spec_helper'
require 'addressable/uri'

RequestCounter = Struct.new(:count)

RSpec.describe DropletKit::PaginatedResource do
  let(:request_count) { RequestCounter.new(0) }

  let(:connection) { Faraday.new {|b| b.adapter :test, stubs } }
  let(:stubs) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/droplets') do |env|
        request_count.count += 1
        uri = Addressable::URI.parse(env[:url].to_s)
        page = (uri.query_values['page'] || 1).to_i
        range = (((page-1)*20)..((page-1)*20+20))
        [200, {}, { objects: range.to_a, meta: { total: 40 } }.to_json ]
      end
    end
  end
  let(:action) { ResourceKit::Action.new(:find, :get, '/droplets') }
  let(:action_connection) { DropletKit::ActionConnection.new(action, connection) }

  before do
    action.query_keys :per_page, :page
    action.handler(200) { |r| JSON.load(r.body)['objects'] }
  end

  describe '#initialize' do
    it 'initializes with a action connection struct' do
      instance = DropletKit::PaginatedResource.new(action_connection)
      expect(instance.action).to be(action)
      expect(instance.connection).to be(connection)
      expect(instance.cursor).to be(0)
    end
  end

  describe '#each' do
    subject(:paginated) { DropletKit::PaginatedResource.new(action_connection) }

    it 'iterates over every object returned from the API' do
      total = 0
      paginated.each do |object|
        total += 1
      end

      expect(total).to eq(40)
    end

    it 'called the API twice' do
      expect {|b| paginated.each {|c| c } }.to change { request_count.count }.to(2).from(0)
    end

    it 'returns the correct objects' do
      expect(paginated.first(3)).to eq([0,1,2])
    end
  end
end