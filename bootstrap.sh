#!/usr/bin/env bash

apt-get update

apt-get remove docker docker-engine docker.io runc

apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io

usermod -aG docker vagrant

curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh

bash nodesource_setup.sh

apt-get install -y nodejs

npm install -g @vue/cli

curl -sL https://golang.org/dl/go1.16.10.linux-amd64.tar.gz

tar -C /usr/local -xzf go1.16.10.linux-amd64.tar.gz

echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

curl -s https://packagecloud.io/install/repositories/golang-migrate/migrate/script.deb.sh | bash

apt-get install -y migrate

