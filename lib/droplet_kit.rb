require "droplet_kit/version"
require 'resource_kit'
require 'kartograph'

module DropletKit
  autoload :Client, 'droplet_kit/client'

  # Models
  autoload :BaseModel, 'droplet_kit/models/base_model'
  autoload :Droplet, 'droplet_kit/models/droplet'
  autoload :Region, 'droplet_kit/models/region'
  autoload :Image, 'droplet_kit/models/image'
  autoload :Size, 'droplet_kit/models/size'
  autoload :NetworkHash, 'droplet_kit/models/network_hash'
  autoload :Network, 'droplet_kit/models/network'
  autoload :Kernel, 'droplet_kit/models/kernel'
  autoload :Snapshot, 'droplet_kit/models/snapshot'
  autoload :Backup, 'droplet_kit/models/backup'
  autoload :Action, 'droplet_kit/models/action'
  autoload :Domain, 'droplet_kit/models/domain'
  autoload :DomainRecord, 'droplet_kit/models/domain_record'

  # Resources
  autoload :DropletResource, 'droplet_kit/resources/droplet_resource'
  autoload :ActionResource, 'droplet_kit/resources/action_resource'
  autoload :DomainResource, 'droplet_kit/resources/domain_resource'
  autoload :DomainRecordResource, 'droplet_kit/resources/domain_record_resource'
  autoload :DropletActionResource, 'droplet_kit/resources/droplet_action_resource'

  # JSON Maps
  autoload :DropletMapping, 'droplet_kit/mappings/droplet_mapping'
  autoload :ImageMapping, 'droplet_kit/mappings/image_mapping'
  autoload :RegionMapping, 'droplet_kit/mappings/region_mapping'
  autoload :SizeMapping, 'droplet_kit/mappings/size_mapping'
  autoload :NetworkMapping, 'droplet_kit/mappings/network_mapping'
  autoload :NetworkDetailMapping, 'droplet_kit/mappings/network_detail_mapping'
  autoload :KernelMapping, 'droplet_kit/mappings/kernel_mapping'
  autoload :SnapshotMapping, 'droplet_kit/mappings/snapshot_mapping'
  autoload :BackupMapping, 'droplet_kit/mappings/backup_mapping'
  autoload :ActionMapping, 'droplet_kit/mappings/action_mapping'
  autoload :DomainMapping, 'droplet_kit/mappings/domain_mapping'
  autoload :DomainRecordMapping, 'droplet_kit/mappings/domain_record_mapping'
  autoload :DropletActionMapping, 'droplet_kit/mappings/droplet_action_mapping'

  # Errors
  autoload :ErrorMapping, 'droplet_kit/mappings/error_mapping'
  FailedCreate = Class.new(StandardError)
  FailedUpdate = Class.new(StandardError)
end
