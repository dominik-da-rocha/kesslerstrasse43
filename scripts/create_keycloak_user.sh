#!/bin/bash

user=$1
if [[ "$user" == "" ]]; then 
   user="admin"
fi

password=$2
if [[ "$password" == "" ]]; then 
   password="password"
fi


docker exec keycloak /opt/jboss/keycloak/bin/add-user-keycloak.sh -u $user -p $password
docker restart keycloak