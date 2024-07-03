#!/bin/bash

get_random_part()
{
    # Generate a random string of 8 characters (alphanumeric)
    head /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 8
}

ENV=$1

PREFIX='devsu-'

USER=$(get_random_part)
PWD=$(get_random_part)
DB=$(get_random_part)

DBNAME=$PREFIX$DB
DBUSER=$PREFIX$USER
DBPWD=$PREFIX$DB

kubectl get secret db-name -o name -n $ENV > /dev/null 2>&1

if [ ! $? -eq 0 ]; then
    kubectl create secret generic db-name --from-literal=db-name='$DBNAME' -n $ENV
    kubectl create secret generic db-user --from-literal=db-user='$DBUSER' -n $ENV
    kubectl create secret generic db-pwd --from-literal=db-pwd='$DBPWD' -n $ENV
fi
