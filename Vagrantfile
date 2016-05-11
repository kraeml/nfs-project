Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  config.vm.provision "shell", inline: "echo Hello"

  config.vm.box = "ubuntu/trusty64"
  #config.vm.box = "geerlingguy/ubuntu1604"
  #config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    v.linked_clone = true
  end

  config.vm.define "gw" do |gw|
    gw.vm.network "private_network", ip: "192.168.2.3"
    gw.vm.network "private_network", ip: "192.168.6.2", virtualbox__intnet: "Gruen"
    gw.vm.network "public_network"
    gw.vm.provision "shell", inline: "echo gw Netz einstellen"
    gw.vm.hostname = "gw"
  end

  config.vm.define "ctl" do |ctl|
    ctl.vm.network "private_network", ip: "192.168.6.3", virtualbox__intnet: "Gruen"
    ctl.vm.hostname = "ctl"
  end

  config.vm.define "web1" do |web1|
    web1.vm.network "private_network", ip: "192.168.6.4", virtualbox__intnet: "Gruen"
    web1.vm.hostname = "web1"
  end

  config.vm.define "web2" do |web2|
    web2.vm.network "private_network", ip: "192.168.6.5", virtualbox__intnet: "Gruen"
    web2.vm.hostname = "web2"
  end

  config.vm.define "fs1" do |fs1|
    fs1.vm.network "private_network", ip: "192.168.6.6", virtualbox__intnet: "Gruen"
    fs1.vm.hostname = "fs1"
  end

  config.vm.define "fs2" do |fs2|
    fs2.vm.network "private_network", ip: "192.168.6.7", virtualbox__intnet: "Gruen"
    fs2.vm.hostname = "fs2"
  end
end
