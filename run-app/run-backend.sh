#!/usr/bin/env bash
echo "Hello from backend!"

#Set the env var PORT for th backend running in port 4001
echo 'export PORT=4001' >> /home/vagrant/.profile
source .profile
cd /shared/
#Detach the process of running the Go app
nohup ./vuego-demoapp > output.out 2>&1 &