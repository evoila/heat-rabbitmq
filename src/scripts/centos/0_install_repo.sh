#!/bin/bash 

# WRITE REPOSITORY CONFIGURATION
cat <<EOF > /etc/yum.repos.d/rabbitmq-server.repo
[rabbitmq-server]
name=rabbitmq_rabbitmq-server
baseurl=https://packagecloud.io/rabbitmq/rabbitmq-server/el/7/\$basearch
gpgcheck=1
enabled=1
gpgkey=https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey
EOF

# APPEND PROXY CONFIGURATION IF GIVEN
if [ ! -z $http_proxy ]; then
proxy="http://"$(echo $http_proxy | sed 's#http://##g' | cut -d '@' -f 2)
credentials=$(echo $http_proxy | sed 's#http://##g' | cut -d '@' -f 1)
username=$(echo $credentials | cut -d ':' -f 1)
password=$(echo $credentials | cut -d ':' -f 2)
cat <<EOF >> /etc/yum.repos.d/rabbitmq-server.repo
proxy=$proxy
proxy_username=$username
proxy_password=$password
EOF
fi

# UPDATE YUM CACHE
yum makecache

# IMPORT PUBLIC SIGNING KEY FOR RABBITMQ
export https_proxy=$https_proxy
rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
