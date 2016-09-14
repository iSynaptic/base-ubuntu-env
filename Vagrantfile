# -*- mode: ruby -*-
# vi: set ft=ruby :

if File.file?('Vagrantfile.user')
  load 'Vagrantfile.user'
end

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/wily64"
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.network "private_network", type: "dhcp"

  config.vm.provision "file", source: "scripts", destination: "/tmp/scripts"
  config.vm.provision "shell", inline: <<-SHELL
    echo "Running standard installation script..."

    pushd /tmp/scripts
    chmod +x ./*
    ./standard-install.sh
    popd
SHELL

  if self.respond_to?('userVagrantConfig')
    userVagrantConfig(config)
  end

end
