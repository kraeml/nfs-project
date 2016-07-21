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
    meter.vm.provision "shell", inline: "sudo apt-add-repository -y ppa:brightbox/ruby-ng; sudo apt-get update; sudo apt-get -y install ruby2.3 ruby2.3-dev rake jmeter"
    meter.vm.provision "shell", inline: "sudo gem install serverspec serverspec-runner"
    #meter.vm.provision "shell", inline: "sudo service lxdm start"
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
    fs.vm.provision "shell", inline: "sudo apt-get update; sudo apt-get install -y nfs-kernel-server"
    fs.vm.provision "shell", inline: "sudo cp /vagrant/provision/fs/etc/exports /etc/exports"
    fs.vm.provision "shell", inline: "sudo mkdir /var/nfs"
    fs.vm.provision "shell", inline: "sudo chown vagrant: /var/nfs"
    fs.vm.provision "shell", inline: "sudo exportfs -ra"
  end

end
