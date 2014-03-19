# -*- mode: ruby -*-
# vi: set ft=ruby :

# Uncomment these lines (and the ones in the generated Gemfile) if you want
# to live on the Edge:
#
Vagrant.require_plugin "vagrant-berkshelf"
Vagrant.require_plugin "vagrant-omnibus"

Vagrant.configure("2") do |config|
  config.vm.hostname = "seyren"

  # Set the version of chef to install using the vagrant-omnibus plugin
  config.omnibus.chef_version = :latest

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "opscode-centos-6.5"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.network :forwarded_port, guest: 8080, host: 8080, id: "seyren", auto_correct: true

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :auto

    chef.run_list = [
      'recipe[seyren::default]'
    ]

    chef.json = {
      'java' => {
        'install_flavor' => 'oracle',
        'jdk_version' => '7',
        'oracle' => {
          'accept_oracle_download_terms' => 'true'
        }
      },
      'ark' => {
        'package_dependencies' => []
      },
      'tomcat' => {
        'ssl_enable' => false,
        'java_options' => '-Xmx192M -Djava.awt.headless=true -DSEYREN_LOG_PATH="/var/log/tomcat6/"'
      }
    }

  end
end
