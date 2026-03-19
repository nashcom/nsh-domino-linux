#!/bin/bash

# Creates a Gitea admin user

read -p "user: " -e USER
read -p "password: " -e PASSWORD
read -p "e-mail: " -e EMAIL

docker exec -u 1000 gitea gitea admin user create --username "$USER" --password "$PASSWORD" --email "$EMAIL" --admin
