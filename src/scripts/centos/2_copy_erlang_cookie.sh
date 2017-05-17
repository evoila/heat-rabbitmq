#!/bin/bash -x 

ERLANG_COOKIE_PATH='/var/lib/rabbitmq/.erlang.cookie'

echo "Copy the erlang cookie from the first rabbit node"
if [ ! -f $ERLANG_COOKIE_PATH ]; then
  service rabbitmq-server start
fi
cp $ERLANG_COOKIE_PATH ${heat_outputs_path}.erlang_cookie
