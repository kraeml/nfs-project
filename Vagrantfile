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

  config.vm.define "meter" do |meter|
    meter.vm.network "private_network", ip: "192.168.2.3"
    meter.vm.network "private_network", ip: "192.168.6.2", virtualbox__intnet: "Gruen"
    meter.vm.provision "shell", inline: "echo meter Netz einstellen"
    meter.vm.hostname = "meter"
    meter.vm.provider "virtualbox" do |v|
      v.gui = true
    end
  end

  config.vm.define "web" do |web|
    web.vm.network "private_network", ip: "192.168.6.3", virtualbox__intnet: "Gruen"
    web.vm.hostname = "web"
  end

  config.vm.define "fs" do |fs|
    fs.vm.network "private_network", ip: "192.168.6.4", virtualbox__intnet: "Gruen"
    fs.vm.hostname = "fs"
  end

end
