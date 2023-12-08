#!/bin/bash

read -p "Do you want to install apache2 or mysql-server or postgresql or
mongoDB? (y/n) " yn

case $yn in
[Yy]* )
  # if user chooses a updates and Apache2 are installed
  read -p "Which one? (a/s/p/m) " choice
  if [ "$choice" = "a" ]; then
     sudo apt update -y && sudo apt install -y apache2

  # if user chooses s updates and mysql are installed
  elif [ "$choice" = "s" ]; then
    sudo apt update -y &&  sudo apt install -y mysql-server

  # if user chooses p updates and Postgresql are installed
  elif [ "$choice" = "p" ]; then
    sudo apt update -y &&  sudo apt install -y postgresql-server-dev-all

  # if user chooses m updates and MongoDB are installed
  elif [ "$choice" = "m" ]; then
    sudo apt update -y
    sudo apt-get install gnupg curl
    curl -fsSL https://pgp.mongodb.com/server-7.0.asc | sudo gpg -o
/usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
    echo "deb [ arch=amd64,arm64
signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ]
https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo
tee /etc/apt/sources.list.d/mongodb-org-7.0.list
    sudo apt-get install -y mongodb-org

  # if user input a different letter then "Invalid choice. Exiting" is printed
  else
    echo "Invalid choice. Exiting"
    exit 1
  fi
  ;;
# if user chooses n for no then "Exiting without installation" is printed
[Nn]* )
  echo "Exiting without installation"
  ;;
* )
  echo "Invalid choice. Exiting"
  ;;
esac
