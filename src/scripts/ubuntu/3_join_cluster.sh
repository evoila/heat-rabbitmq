#!/bin/bash                                                                                                                                    

. /etc/os-release

ERLANG_COOKIE=$erlang_cookie
MASTER_HOSTNAME=$master_hostname

MY_NAME=$(hostname -s)

if [ $MASTER_HOSTNAME == $MY_NAME ]; then
  exit 0
fi

if [ $ID == "ubuntu" ]; then
  service rabbitmq-server stop
fi

echo "Copy erlang cookie"
printf $ERLANG_COOKIE > /var/lib/rabbitmq/.erlang.cookie

if [ $ID == "rhel" ]; then
  chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
  chmod 400 /var/lib/rabbitmq/.erlang.cookie
fi

service rabbitmq-server start
rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@"$MASTER_HOSTNAME"
rabbitmqctl start_app
