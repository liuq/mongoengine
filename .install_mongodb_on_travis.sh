#!/bin/bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

if [ "$MONGODB" = "2.4" ]; then
    echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb.list
    sudo apt-get update
    sudo apt-get install mongodb-10gen=2.4.14
    # No need for `sudo service mongodb start` because v2.4 starts automatically
elif [ "$MONGODB" = "2.6" ]; then
    echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | sudo tee /etc/apt/sources.list.d/mongodb.list
    sudo apt-get update
    sudo apt-get install mongodb-org-server=2.6.12
    sudo service mongodb start
elif [ "$MONGODB" = "3.0" ]; then
    echo "deb http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
    sudo apt-get update
    sudo apt-get install mongodb-org-server=3.0.14
    sudo service mongodb start
else
    echo "Invalid MongoDB version, expected 2.4, 2.6, or 3.0."
    exit 1
fi;
