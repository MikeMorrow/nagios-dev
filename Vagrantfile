# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', 2048,
                  '--cpus', 2, '--ioapic', 'on']
  end
  # ---------------------------------------------------------------------------
  # Global properties
  # ---------------------------------------------------------------------------
  config.vm.box = "MikeMorrow/centos.7.2"
  # config.vm.box  = "ubuntu/trusty64"
  # config.vm.box  = "ubuntu/vivid64"
  # ---------------------------------------------------------------------------
  # Nagios Client
  # ---------------------------------------------------------------------------
  config.vm.define :client do |client|
    client.vm.network :private_network, ip: "192.168.3.22"
    client.vm.hostname = 'client'
    client.vm.provision "shell", path: "scripts/setupEnvironment.sh"
    # client.vm.provision "shell", path: "scripts/ubuntu/installCheckmkClient.sh"
    # client.vm.provision "shell", path: "scripts/centos/installNagiosClient.sh"
    client.vm.provision "shell", path: "scripts/centos/installCheckmkClient.sh"
  end
  # ---------------------------------------------------------------------------
  # Nagios Server
  # ---------------------------------------------------------------------------
  config.vm.define :nagiosServer do |nagiosServer|
    nagiosServer.vm.network :private_network, ip: "192.168.3.21"
    nagiosServer.vm.hostname = 'nagiosServer'
    nagiosServer.vm.provision "shell", path: "scripts/setupEnvironment.sh"
    # nagiosServer.vm.provision "shell", path: "scripts/ubuntu/installOMD.sh"
    nagiosServer.vm.provision "shell", path: "scripts/centos/installNagiosServer.sh"
    nagiosServer.vm.provision "shell", path: "scripts/centos/installCheckmkClient.sh"
    nagiosServer.vm.provision "shell", path: "scripts/centos/installCheckmkServer.sh"
  end
end
