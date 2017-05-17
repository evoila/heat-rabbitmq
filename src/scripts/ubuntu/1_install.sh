#!/bin/bash

. /etc/os-release

if [ $ID == "ubuntu" ]; then
  apt-get install -y rabbitmq-server
elif [ $ID == "rhel" ]; then
  yum install -y rabbitmq-server
fi 
