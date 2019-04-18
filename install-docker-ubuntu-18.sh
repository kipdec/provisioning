#!/bin/bash
sudo apt update
yes | sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker jenkins

