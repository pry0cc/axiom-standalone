Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.ssh.insert_key = false
  config.ssh.private_key_path = ["/home/op/.ssh/id_rsa", "/home/op/.vagrant.d/insecure_private_key"]
  config.vm.provision "file", source: "/home/op/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/me.pub"
  config.vm.provision "shell", inline: <<-SHELL
        apt update
        apt install -y git wget
        cd /tmp
        git clone https://github.com/pry0cc/axiom-standalone
        cd axiom-standalone
        sudo -u vagrant ./install.sh
	mkdir -p /home/vagrant/.ssh/
	chown -R vagrant /home/vagrant/.ssh
	echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==" >> /home/vagrant/.ssh/authorized_keys
	echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==" >> /root/.ssh/authorized_keys
	cat /home/vagrant/.ssh/me.pub | tee -a /home/vagrant/.ssh/authorized_keys
	cat /home/vagrant/.ssh/me.pub | tee -a /root/.ssh/authorized_keys
	chmod 0600 /home/vagrant/.ssh/authorized_keys
        chsh -s /usr/bin/zsh vagrant
	sudo dd if=/dev/zero of=/EMPTY bs=1M
	sudo rm -f /EMPTY
  SHELL
end
