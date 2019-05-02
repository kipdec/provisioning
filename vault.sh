#!/bin/bash
// Install unzip
echo "Installing unzip..."
sudo apt install unzip

// Get vault
echo "Getting vault..."
wget https://releases.hashicorp.com/vault/1.1.2/vault_1.1.2_linux_amd64.zip

// Unzip it
echo "Unzipping..."
unzip vault_1.1.2_linux_amd64.zip

echo "Changing ownership..."
sudo chown root:root vault

echo "Moving directories..."
sudo mv vault /usr/local/bin
vault --version

echo "Cleaning up..."
echo "Removing the .zip..."
sudo rm vault_1.1.2_linux_amd64.zip

echo "Setting up vault..."
vault -autocomplete-install
complete -C /usr/local/bin/vault vault
sudo setcap cap_ipc_lock=+ep /usr/local/bin/vault

echo "Adding non-priveleged user to run vault"
sudo useradd --system --home /etc/vault.d --shell /bin/false vault

echo "Copying vault service file..."
sudo cp vault.service /etc/systemd/system/vault.service

echo "Creating config file..."
sudo mkdir --parents /etc/vault.d
sudo touch /etc/vault.d/vault.hcl
sudo chown --recursive vault:vault /etc/vault.d
sudo chmod 640 /etc/vault.d/vault.hcl

sudo echo "listener \"tcp\" {" >> /etc/vault.d/vault.hcl
sudo echo "  address       = \"0.0.0.0:8200\"" >> /etc/vault.d/vault.hcl
sudo echo "}" >> /etc/vault.d/vault.hcl
echo "Enabling UI"
sudo echo "ui = true" >> /etc/vault.d/vault.hcl
sudo systemctl enable vault
sudo systemctl start vault
sudo systemctl status vault
echo "Done!"
