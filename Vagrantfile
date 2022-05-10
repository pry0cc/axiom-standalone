Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.provision "shell", inline: <<-SHELL
        apt update
        apt install -y git wget
        cd /tmp
        git clone https://github.com/pry0cc/axiom-standalone
        cd axiom-standalone
        sudo -u vagrant ./install.sh
        chsh -s /usr/bin/zsh vagrant
  SHELL
end
