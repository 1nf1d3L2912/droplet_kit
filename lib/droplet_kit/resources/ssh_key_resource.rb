module DropletKit
  class SSHKeyResource < ResourceKit::Resource
    resources do
      default_handler(:ok, :created) {|r| SSHKeyMapping.extract_single(r.body, :read) }

      action :all, 'GET /v2/account/keys' do
        handler(:ok) { |response| SSHKeyMapping.extract_collection(response.body, :read) }
      end

      action :create, 'POST /v2/account/keys' do
        body {|object| SSHKeyMapping.representation_for(:create, object) }
      end

      action :find, 'GET /v2/account/keys/:id'

      action :update, 'PUT /v2/account/keys/:id' do
        body {|ssh_key| SSHKeyMapping.representation_for(:update, ssh_key) }
      end
    end
  end
end