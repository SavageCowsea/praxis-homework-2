#!/usr/bin/env bash
echo "Hello world!"
#Installing Git
sudo yum install git -y

#Installing node
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y

#Installing Vue
npm install -g @vue/cli

#Installing Go
wget -c https://golang.org/dl/go1.15.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xvzf go1.15.2.linux-amd64.tar.gz
mkdir -p ~/go_projects/{bin,src,pkg}
sudo sh -c "echo 'export  PATH=$PATH:/usr/local/go/bin' >> /etc/profile"
sudo sh -c "echo 'export GOPATH="$HOME/go_projects"' >> /home/vagrant/.bash_profile"
sudo sh -c "echo 'export GOBIN="$GOPATH/bin"'+  >> /home/vagrant/.bash_profile"
source /home/vagrant/.bash_profile



#Clone the repository
git clone https://github.com/jdmendozaa/vuego-demoapp.git

#Building the Go project
cd vuego-demoapp/server
go build
sudo sh -c "echo 'export PORT=4001' >> /etc/profile"


#Moving the Go artifact to shared
cd /
cp /home/vagrant/vuego-demoapp/server/vuego-demoapp /shared/


#Build the Vue app
cd home/vagrant/vuego-demoapp/spa
sudo npm install 
sudo echo 'VUE_APP_API_ENDPOINT="http://10.0.0.8:4001/api"' >> .env.production
npm run build
