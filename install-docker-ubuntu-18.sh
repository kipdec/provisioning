#!/bin/bash
sudo apt upgrade
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
