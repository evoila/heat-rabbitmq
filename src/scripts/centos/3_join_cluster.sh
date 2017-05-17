#!/bin/bash 

ERLANG_COOKIE=$erlang_cookie
MASTER_HOSTNAME=$master_hostname

MY_NAME=$(hostname -s)

if [ $MASTER_HOSTNAME == $MY_NAME ]; then
  exit 0
fi

echo "Copy erlang cookie"
printf $ERLANG_COOKIE > /var/lib/rabbitmq/.erlang.cookie

chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
chmod 400 /var/lib/rabbitmq/.erlang.cookie

service rabbitmq-server start
rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@"$MASTER_HOSTNAME"
rabbitmqctl start_app
