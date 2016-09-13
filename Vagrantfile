# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/wily64"

  config.vm.network "public_network"
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.synced_folder "../", "/projects"

  config.vm.provision "shell", inline: <<-SHELL
    function echoGreen() {
      GREEN='\033[0;32m'
      NC='\033[0m' # No Color

      MSG=$1
      printf "${GREEN}${MSG}${NC}\n"
    }

    if ! which git > /dev/null; then
      echoGreen "Installing Git"
      
      add-apt-repository ppa:git-core/ppa
      apt-get update
      apt-get install -y git
    fi

    if ! which docker > /dev/null; then
      echoGreen "Installing Docker..."
      curl -sSL https://get.docker.com | sh

      usermod -a -G docker vagrant
    fi

    if ! which docker-compose > /dev/null; then
      echoGreen "Installing Docker Compose..."
      curl -sL https://github.com/docker/compose/releases/download/1.8.0/docker-compose-Linux-x86_64 -o /tmp/dc
      install /tmp/dc /usr/local/bin/docker-compose
      rm /tmp/dc
    fi

    if ! which nano > /dev/null; then
      apt-get install -y nano
    fi

    if [ -f /vagrant/ubuntu-xenial-16.04-cloudimg-console.log ]; then
      echoGreen "Removing Vagrant log file..."
      rm /vagrant/ubuntu-xenial-16.04-cloudimg-console.log
    fi

    if ! which zsh > /dev/null; then
      echoGreen "Installing Z-Shell..."
      apt-get install -y zsh

      if [ -f /bin/zsh ]; then
        chsh -s /bin/zsh vagrant
      fi
    fi

    if [ ! -d ~/.oh-my-zsh ]; then
      echoGreen "Installing Oh My Zsh..."

      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      sudo cp -rf /root/.oh-my-zsh /home/vagrant/.oh-my-zsh
    fi

    if [ ! -f /home/vagrant/.zshrc ]; then
      echoGreen "Installing Z-Shell profile..."
      cp /vagrant/zshrc /home/vagrant/.zshrc
      cp /vagrant/zshrc /root/.zshrc
    fi

    SOURCE_PROFILE_HASH=($(md5sum /vagrant/zshrc))
    LOCAL_PROFILE_HASH=($(md5sum /home/vagrant/.zshrc))

    if [ ! "$LOCAL_PROFILE_HASH" == "$SOURCE_PROFILE_HASH" ]; then
      echoGreen "Updating Z-Shell profile..."
      rm /home/vagrant/.zshrc
      rm /root/.zshrc

      cp /vagrant/zshrc /home/vagrant/.zshrc
      cp /vagrant/zshrc /root/.zshrc
    fi

  SHELL

  #config.vm.define "one"
  #config.vm.define "two"
  #config.vm.defince "three"
end
