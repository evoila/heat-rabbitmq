#!/bin/bash

NAME=${NAME}

rabbitmqctl add_vhost $NAME
rabbitmqctl set_permissions -p $NAME admin '.*' '.*' '.*'
