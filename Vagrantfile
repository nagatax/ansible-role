# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"
  #config.vm.box = "ubuntu/bionic64"

  # The settings within config.ssh relate to configuring how Vagrant will access
  # your machine over SSH. As with most Vagrant settings, the defaults are
  # typically fine, but you can fine tune whatever you would like.
  config.ssh.insert_key = false

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  config.vm.define "web" do |web|
    # hostname setting
    web.vm.hostname = "local.web"

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    web.vm.network "private_network", ip: "192.168.34.50"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # (!!注意!!)synced_folderで指定したフォルダ内は、ゲストマシン側で権限を変更できない
    #web.vm.synced_folder "./webapp", "/var/www/html/laravelapp", mount_options: ['dmode=777','fmode=777']

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    web.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false

      # Customize the amount of cpus on the VM:
      vb.cpus = "2"

      # Customize the amount of memory on the VM:
      vb.memory = "3072"
    end

    web.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "site.yml"
    end
  end

end
