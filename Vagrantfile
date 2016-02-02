# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "centos-6.6", autostart: false do |v|
    v.vm.box = "puppetlabs/centos-6.6-64-puppet"
    v.vm.box_version = "1.0.1"
    v.vm.hostname = "centos-6.6"
  end

  config.vm.define "centos-7.0", autostart: false do |v|
    v.vm.box = "puppetlabs/centos-7.0-64-puppet"
    v.vm.box_version = "1.0.1"
    v.vm.hostname = "centos-7.0"
  end

  config.vm.define "ubuntu-12.04", autostart: false do |v|
    v.vm.box = "puppetlabs/ubuntu-12.04-64-puppet"
    v.vm.box_version = "1.0.1"
    v.vm.hostname = "ubuntu-12.04"
  end

  config.vm.define "ubuntu-14.04", autostart: false do |v|
    v.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
    v.vm.box_version = "1.0.1"
    v.vm.hostname = "ubuntu-14.04"
  end
    
  config.vm.provision :shell do |shell|
     shell.inline = "sudo API_TOKEN=\"#{ENV['API_TOKEN']}\" /vagrant/install.sh; exit 0"
  end

end
