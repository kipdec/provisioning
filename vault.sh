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
