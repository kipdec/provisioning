// Install unzip
sudo apt install unzip

// Get vault
wget https://releases.hashicorp.com/vault/1.1.2/vault_1.1.2_linux_amd64.zip

// Unzip it
unzip vault_1.1.2_linux_amd64.zip

mkdir .vault
mv vault .vault

echo "export PATH=~/.vault:$PATH"  >> ~/.bashrc
