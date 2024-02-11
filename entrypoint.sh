#!/bin/bash
sleep 2
export HOME=/home/container
cd /home/container
apt update
apt install -y wget git make cmake g++ liblua5.3 libz-dev rapidjson-dev libcurl4-openssl-dev libboost-all-dev libssl-dev

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
wget https://github.com/dankmeme01/globed2/releases/download/v${VERSION}/globed-central-server-x64
chmod +x *

# Run the Server
bash ./globed-central-server-x64
