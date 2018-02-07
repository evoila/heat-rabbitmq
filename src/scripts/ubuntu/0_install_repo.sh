#!/bin/bash                                                                                                                                    

. /etc/os-release

# WRITE REPOSITORY CONFIGURATION
echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list

# DOWNLOAD AND INSTALL REPOSITORY KEY
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 6026DFCA

apt-get update
