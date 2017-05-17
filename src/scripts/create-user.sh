#!/bin/bash

USERNAME=${USERNAME}
PASSWORD=${PASSWORD}
VHOST=${VHOST}

rabbitmqctl add_user $USERNAME $PASSWORD
rabbitmqctl set_permissions -p $VHOST $USERNAME '.*' '.*' '.*'
