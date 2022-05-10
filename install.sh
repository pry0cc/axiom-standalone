#!/bin/bash

set -o errexit

if [[ $EUID -eq 0 ]]; then
   echo "This script must not be run as root" 
   exit 1
fi

# vars
GO_URL="https://golang.org/dl/go1.17.linux-amd64.tar.gz"
START=$(pwd)

sudo apt update
sudo apt -y install curl

# initial setup
echo "Updating..."
sudo apt update
echo "Upgrading"
sudo apt -y upgrade
echo "installing base packages"

# FS Stuff
mkdir -p ~/tools
mkdir -p ~/lists

# base packages
sudo apt -y install tmux cargo locales texlive-font-utils rubber texlive-xetex texlive-luatex latexmk ca-certificates libgcc1 libgssapi-krb5-2 liblttng-ust0 libstdc++6 zlib1g xsltproc masscan libffi-dev libssl-dev curl nmap ufw neovim fail2ban net-tools zsh jq build-essential python3 python3-pip python3-venv unzip git p7zip libpcap-dev rubygems ruby-dev grc wget git

# misc tools
wget -q https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | sh
cp configs/zshrc ~/.zshrc
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh && rm get-docker.sh
wget -O /tmp/go.tar.gz "$GO_URL"; sudo tar -C /usr/local -xzf /tmp/go.tar.gz
git clone https://github.com/blechschmidt/massdns.git /tmp/massdns; cd /tmp/massdns; make -s; sudo mv bin/massdns /usr/bin/massdns
wget -O /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/powershell-7.1.4-linux-x64.tar.gz && sudo mkdir -p /opt/microsoft/powershell/7 && sudo tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7 && sudo chmod +x /opt/microsoft/powershell/7/pwsh && sudo ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh

# go packages
GO111MODULE=off /usr/local/go/bin/go get -u github.com/tomnomnom/gf
GO111MODULE=on /usr/local/go/bin/go get -v github.com/projectdiscovery/dnsx/cmd/dnsx
GO111MODULE=on /usr/local/go/bin/go get -u github.com/lc/gau
GO111MODULE=on /usr/local/go/bin/go get -v github.com/projectdiscovery/httpx/cmd/httpx
GO111MODULE=on /usr/local/go/bin/go get -v github.com/projectdiscovery/interactsh/cmd/interactsh-client

GO111MODULE=on /usr/local/go/bin/go get -u github.com/tomnomnom/anew
GO111MODULE=on /usr/local/go/bin/go get -u github.com/tomnomnom/fff
GO111MODULE=on /usr/local/go/bin/go get -u github.com/ffuf/ffuf
GO111MODULE=on /usr/local/go/bin/go get -u github.com/tomnomnom/gron
GO111MODULE=on /usr/local/go/bin/go get -u github.com/tomnomnom/meg
GO111MODULE=on /usr/local/go/bin/go get -u github.com/tomnomnom/qsreplace

/usr/local/go/bin/go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
/usr/local/go/bin/go install github.com/d3mondev/puredns/v2@latest
/usr/local/go/bin/go install github.com/pry0cc/tew@latest
/usr/local/go/bin/go install github.com/leesoh/np/cmd/np@latest

/usr/local/go/bin/go install github.com/hakluke/hakrawler@latest

# pip tools
pip3 install impacket
pip3 install bloodhound
pip3 install pipx
pip3 install nmaptocsv
pip3 install csvtomd
~/.local/bin/pipx ensurepath
~/.local/bin/pipx install crackmapexec

# ruby tools
sudo gem install wpscan
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall

# git repo's
git clone https://github.com/lgandx/Responder.git ~/tools/responder
git clone https://github.com/danielmiessler/SecLists.git ~/lists/seclists

cd "$START"
mkdir -p ~/.config 
mkdir -p ~/.local/share

cd "$START"

cp configs/nvim.tar.gz ~/.config/
cp configs/nvim-share.tar.gz ~/.local/share/

cd ~/.config
tar -xf nvim.tar.gz

cd ~/.local/share
tar -xf nvim-share.tar.gz
