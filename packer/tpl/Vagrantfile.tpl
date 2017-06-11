# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "vagrant-fedora25-desktop"
  config.vm.box = "viewzr-2.0-dev"

  config.vm.provider "virtualbox" do |vb, override|
    vb.gui = true
    vb.customize ["modifyvm", :id "--memory", 4096]
    vb.customize ["modifyvm", :id, "--cpus", 2]
  end
end
