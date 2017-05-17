#!/bin/bash                                                                                                                                    

ADMIN_PASSWORD=${ADMIN_PASSWORD}
MASTER_HOSTNAME=$master_hostname

if [ $MASTER_HOSTNAME == $HOSTNAME ]; then
  rabbitmqctl add_user admin "$ADMIN_PASSWORD"
  rabbitmqctl set_user_tags admin administrator
  rabbitmqctl set_permissions admin ".*" ".*" ".*"
fi

# Make all queues highly available
rabbitmqctl set_policy ha-all ".*" '{"ha-mode":"all"}'
