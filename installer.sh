#!/bin/bash
echo "Removing Ngrok if exists..."
sudo systemctl stop ngrok.service
sudo systemctl disable ngrok.service
sudo rm /lib/systemd/system/ngrok.service
sudo rm -rf /opt/
echo "Ngrok removed successfully!"
echo "Reinstalling Ngrok..."
echo "Removing install.sh file and systemd-ngrok if exists..."
sudo rm -rf install.sh systemd-ngrok
echo "Downloading Ngrok installer..."
curl -O https://raw.githubusercontent.com/JohanQueo/systemd-ngrok/master/install.sh
chmod +x install.sh
echo "Which is the device name?"
read deviceName
sudo ./install.sh 2006wlhuGvR7k0OAdGDmfVyVYqr_7Zx4sXvoy9u5MsgeyBNKF $deviceName
echo "Ngrok Installed successfully"
echo "Activate Ngrok..."
cd systemd-ngrok
sudo tar xvf ngrok-link-stable-linux-arm.tgz 
sudo cp ngrok /opt/ngrok 
sudo systemctl restart ngrok.service
echo "Ngrok Activated successfully!"