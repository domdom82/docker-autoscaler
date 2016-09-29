#!/bin/bash

HOSTNAME=$1
TOKEN=$2
SSH_KEYS="['djkey']"

if [ $# -ne 2 ]; then 
  echo "Usage: add_vm.sh HOSTNAME TOKEN"
  exit -1
fi

BODY='{
    "name":"$HOSTNAME",
    "region":"nyc3",
    "size":"512mb",
    "image":"ubuntu-14-04-x64",
    "ssh_keys":$SSH_KEYS,
    "backups":false, 
    "ipv6":true,
    "user_data":null,
    "private_networking":null,
    "volumes": null}'


curl -v -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d "$BODY" "https://api.digitalocean.com/v2/droplets"