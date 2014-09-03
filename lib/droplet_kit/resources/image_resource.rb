module DropletKit
  class ImageResource < ResourceKit::Resource
    resources do
      action :all, 'GET /v2/images' do
        query_keys :page, :per_page
        handler(200) { |response| ImageMapping.extract_collection(response.body, :read) }
      end

      action :find, 'GET /v2/images/:id' do
        handler(200) { |response| ImageMapping.extract_single(response.body, :read) }
      end

      action :delete, 'DELETE /v2/images/:id' do
        handler(204) { |response| true }
      end

      action :update, 'PUT /v2/images/:id' do
        body {|image| ImageMapping.representation_for(:update, image) }
        handler(200) { |response| ImageMapping.extract_single(response.body, :read) }
      end
    end

    def all(*args)
      PaginatedResource.new(action_and_connection(:all), *args)
    end
  end
end