# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
  
  config.vm.define "template" do |t|
    t.vm.box = "geerlingguy/ubuntu1804"
    t.vm.network "private_network", ip: "192.168.60.10"
    t.vm.hostname = "template"
    t.vm.provision "shell", path: "pwsh_remote_linux_install.sh"

    config.vm.provider "virtualbox" do |v|
      v.name = "template"
      v.memory = 4096
      v.cpus = 1
      v.check_guest_additions = false
      end
  end
end