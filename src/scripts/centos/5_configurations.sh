#!/bin/bash 

ADMIN_PASSWORD=${ADMIN_PASSWORD}
MASTER_HOSTNAME=$master_hostname

MY_NAME=$(hostname -s)

if [ ! $MASTER_HOSTNAME == $MY_NAME ]; then
  exit 0
fi

rabbitmqctl add_user admin "$ADMIN_PASSWORD"
rabbitmqctl set_user_tags admin administrator
rabbitmqctl set_permissions admin ".*" ".*" ".*"

# Make all queues highly available
rabbitmqctl set_policy ha-all ".*" '{"ha-mode":"all"}'
