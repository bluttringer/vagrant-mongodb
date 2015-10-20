#!/bin/bash

#######################
### Install MongoDB ###
#######################

# Import the public key used by the package management system
wget -qO - http://docs.mongodb.org/10gen-gpg-key.asc | sudo apt-key add -

# Create a list file for MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# Reload local package database
apt-get update

# Install the latest stable release of MongoDB
apt-get install -y mongodb-org



