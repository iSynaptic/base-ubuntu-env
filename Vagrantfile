# -*- mode: ruby -*-
# vi: set ft=ruby :

if File.file?('Vagrantfile.user')
  load 'Vagrantfile.user'
end

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.box_version = "= 2.2.9"
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2

    v.customize ["modifyvm", :id, "--nictype1", "virtio" ]
    v.customize ["modifyvm", :id, "--nictype2", "virtio" ]
    v.customize ["modifyvm", :id, "--nictype3", "virtio" ]
    v.customize ["modifyvm", :id, "--nictype4", "virtio" ]

    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.network "private_network", type: "dhcp"

  config.vm.provision "shell", inline: <<-SHELL

    if [ -d /tmp/scripts ]; then
      rm -r /tmp/scripts
    fi

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

config.vm.provision "shell", inline: "ps aux | grep 'sshd:' | awk '{print $2}' | xargs kill"

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

  config.vm.provision "shell", inline: <<-SHELL
    IP_ADDR=`ifconfig enp0s8 | grep "inet addr" | awk '{ print substr($2,6) }'`

    cat <<EOF
$(printf '\033[0;32m')

=====================================
==== VM IP Address: $IP_ADDR
=====================================$(printf '\033[0m')
EOF

SHELL

end