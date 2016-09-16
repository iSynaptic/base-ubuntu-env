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

  config.vm.provision "shell", inline: <<-SHELL
    rm -r /tmp/scripts
    cp -rf /vagrant/scripts /tmp/scripts

    echo "Running standard installation script..."

    pushd /tmp/scripts >> /dev/null
    chmod +x ./*
    ./standard-install.sh
    popd >> /dev/null
SHELL


if File.file?('scripts/custom-install.sh.user')
  config.vm.provision "shell", inline: <<-SHELL
      echo "Running privileged custom installation script..."

      pushd /tmp/scripts >> /dev/null
      /bin/bash custom-install.sh.user
      popd >> /dev/null
SHELL
end

if File.file?('scripts/custom-install-restricted.sh.user')
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
      echo "Running restricted custom installation script..."

      pushd /tmp/scripts >> /dev/null
      /bin/bash custom-install-restricted.sh.user
      popd >> /dev/null
SHELL
end

  if Object.respond_to?(:userVagrantConfig, true)
    userVagrantConfig(config)
  end

end
