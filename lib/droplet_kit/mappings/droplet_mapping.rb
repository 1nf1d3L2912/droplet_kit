module DropletKit
  class DropletMapping
    include Kartograph::DSL

    kartograph do
      mapping Droplet
      root_key plural: 'droplets', singlular: 'droplet', scopes: [:read]

      property :id, scopes: [:read]
      property :name, scopes: [:read]
      property :memory, scopes: [:read]
      property :vcpus, scopes: [:read]
      property :disk, scopes: [:read]
      property :locked, scopes: [:read]
      property :created_at, scopes: [:read]
      property :status, scopes: [:read]
      property :backup_ids, scopes: [:read]
      property :snapshot_ids, scopes: [:read]
      property :action_ids, scopes: [:read]
      property :features, scopes: [:read]
    end
  end
end