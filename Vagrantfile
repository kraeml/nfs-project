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
    gw.vm.network "private_network", ip: "192.168.50.4"
    gw.vm.network "private_network", ip: "172.2.1.2", virtualbox__intnet: "Gruen"
    gw.vm.network "public_network"
  end

  config.vm.define "web1" do |web1|
    web1.vm.network "private_network", ip: "172.2.2.2", virtualbox__intnet: "Gruen"
  end


end
