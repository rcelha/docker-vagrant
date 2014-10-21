# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"

    config.vm.provider "virtualbox" do |vb|
        vb.customize [
            "modifyvm",     :id,
            "--cpus",       "4",
            "--memory",     "1024"]
    end


    config.vm.network "forwarded_port", guest: 1000, host: 1000, auto_correct: true
    config.vm.network "forwarded_port", guest: 2000, host: 2000, auto_correct: true
    config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
    config.vm.network "forwarded_port", guest: 4000, host: 4000, auto_correct: true
    config.vm.network "forwarded_port", guest: 5000, host: 5000, auto_correct: true
    config.vm.network "forwarded_port", guest: 6000, host: 6000, auto_correct: true
    config.vm.network "forwarded_port", guest: 7000, host: 7000, auto_correct: true
    config.vm.network "forwarded_port", guest: 8000, host: 8000, auto_correct: true
    config.vm.network "forwarded_port", guest: 9000, host: 9000, auto_correct: true


    config.vm.provision "shell", inline: "locale-gen pt_BR.UTF-8"
    config.vm.provision "shell", inline: "apt-get update"
    config.vm.provision "shell", inline: "apt-get install -y docker.io"
    config.vm.provision "shell", inline: "usermod -aG docker vagrant"

    # GITHUB for windows key
    config.vm.provision "file",
        source: File.join(ENV["HOME"], ".ssh", "github_rsa"),
        destination: "~/.ssh/github_rsa"
    config.vm.provision "file",
        source: File.join(ENV["HOME"], ".ssh", "github_rsa.pub"),
        destination: "~/.ssh/github_rsa.pub"

    config.vm.provision "shell", inline: "chmod 600 ~/.ssh/github_rsa*"

    # SSH Configs
    config.vm.provision "file", source: "00_ssh.config", destination: "~/.ssh/00_ssh.config"
    config.vm.provision "file", source: "10_github.config", destination: "~/.ssh/10_github.config"

    # rc
    config.vm.provision "file", source: "rc/bash_aliases", destination: "~/.bash_aliases"
    config.vm.provision "file", source: "rc/git-bashrc", destination: "~/.git-bashrc"
    config.vm.provision "file", source: "rc/git-completion.sh", destination: "~/.git-completion.sh"
    config.vm.provision "file", source: "rc/gitconfig", destination: "~/.gitconfig"
    config.vm.provision "file", source: "rc/screenrc", destination: "~/.screenrc"
    config.vm.provision "file", source: "rc/vimrc", destination: "~/.vimrc"

end
