# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
  
  config.vm.define "template" do |t|
    t.vm.box = "geerlingguy/ubuntu1804"
    t.vm.network "public_network"
    t.vm.hostname = "template"

    config.vm.provider "virtualbox" do |v|
      v.name = "template"
      v.memory = 4096
      v.cpus = 1
      v.check_guest_additions = false
      end
  end
end