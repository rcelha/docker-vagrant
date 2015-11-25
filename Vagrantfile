# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"

    config.vm.provider "virtualbox" do |vb|
        vb.customize [
            "modifyvm",     :id,
            "--cpus",       "2",
            "--memory",     "1024"]
    end

    config.vm.network "forwarded_port", guest: 8000, host: 8000, auto_correct: true
    config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true

    config.vm.provision "shell", inline: "locale-gen pt_BR.UTF-8"
    config.vm.provision "shell", inline: "wget -qO- https://get.docker.com/ | sh"
    config.vm.provision "shell", inline: "usermod -aG docker vagrant"

    # GITHUB for windows key
    config.vm.provision "file",
        source: File.join(ENV["HOME"], ".ssh", "github_rsa"),
        destination: "/home/vagrant/.ssh/github_rsa"
    config.vm.provision "file",
        source: File.join(ENV["HOME"], ".ssh", "github_rsa.pub"),
        destination: "/home/vagrant/.ssh/github_rsa.pub"
    config.vm.provision "shell", inline: "chmod 600 /home/vagrant/.ssh/github_rsa*"

    # SAMBA
    config.vm.provision "file", source: "samba.conf", destination: "/tmp/smb.conf"
    config.vm.provision :shell, :path => "install_samba.sh"

    # SSH Configs
    config.vm.provision "file", source: "00_ssh.config", destination: "/home/vagrant/.ssh/00_ssh.config"
    config.vm.provision "file", source: "10_github.config", destination: "/home/vagrant/.ssh/10_github.config"

    # DOTFILES
    config.vm.provision "file", source: "dotfiles", destination: "/home/vagrant/dotfiles"
    config.vm.provision "shell", privileged: false, inline: "cd /home/vagrant/dotfiles; python install.py"
end
