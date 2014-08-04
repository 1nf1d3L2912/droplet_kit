module DropletKit
  class DomainResource < ResourceKit::Resource
    resources do
      action :all do
        path '/v2/domains'
        verb :get
        handler(200) { |response| DomainMapping.extract_collection(response.body, :read) }
      end

      action :create do
        path '/v2/domains'
        verb :post
        body { |object| DomainMapping.representation_for(:create, object) }
        handler(201) { |response| DomainMapping.extract_single(response.body, :read) }
      end

      action :find do
        path '/v2/domains/:name'
        verb :get
        handler(200) { |response| DomainMapping.extract_single(response.body, :read) }
      end

      action :delete do
        path '/v2/domains/:name'
        verb :delete
        handler(204) { |response| true }
      end
    end
  end
end