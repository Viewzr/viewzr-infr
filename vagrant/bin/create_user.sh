#!/bin/bash

username=""
password=""
github_username=""
github_password=""

function create_user {
  echo "We are going to create a user for your developer enviroment..."
  echo "Please enter your desired username (anything but vagrant): "
  read username
  sudo useradd -m $username
  echo "Please enter your desired password: "
  read password
  echo "$password" | sudo passwd --stdin $username
  sudo usermod $username -aG wheel
  echo "User created..."
}

function main {
  create_user
}

main
