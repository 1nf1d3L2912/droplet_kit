### Version 1.1.2

* Add `public_ip` and `private_ip` to easily get the IP address on `DropletKit::Droplet` objects returned.

### Version 1.1.1

* Use size_slug instead of size object in droplet mappings.

### Version 1.1.0

* Changing kernels is now `client.droplet_actions.change_kernel(kernel: 'name', droplet_id: 123)` instead of `droplet_actions.kernel()`.
* Include Account resource. `client.account`. This allows you to grab information about the user for the access token provided.
* Paginate more resources. This includes:
  * Droplet Kernels
  * Actions
  * Snapshots
  * Backups
* Allow creating droplets with User Data and Private Networking
  * See [#8](https://github.com/digitalocean/droplet_kit/pull/8) - Thanks @rbishop !
* Fixed a bug where if the resource was paginated and returning 0 entries, an infinite loop would occur.
  * See [#11](https://github.com/digitalocean/droplet_kit/pull/11) - Thanks @webdestroya !

### August 8, 2014 (Initial Release)

* Initial Release