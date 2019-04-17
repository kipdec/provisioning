#!/bin/bash
sudo apt update
echo 'Installing Java 8'
sudo apt install openjdk-8-jdk openjdk-8-jre
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
echo 'Installing Jenkins'
sudo apt install jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
