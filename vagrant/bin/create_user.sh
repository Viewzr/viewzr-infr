#!/bin/bash

username=""
password=""
github_username=""
github_password=""

function create_user {
  echo "We are going to create a user for your developer enviroment..."
  echo "Please enter your desired username (anything but vagrant): "
  read username
  sudo useradd $username
  echo "Please enter your desired password: "
  read password
  echo "$password" | sudo passwd --stdin $username
  echo "User created..."
}


function create_ssh_keys {
  echo "Beginning creation of ssh keys for authentication with github..."
  echo "Switching to newly created user..."
  sudo su - $username bash << EOF
  echo "Beginning generation, please answer the following prompts..."
  ssh-keygen -t rsa -b 4096
  echo "SSH Keys created..."
}

function copy_ssh_keys {
  echo "You will need to enter your github credentials for the next step..."
  echo "Please enter your github username: "
  read $github_username
  echo "Please enter your github password: "
  read $github_password
  KEY=$(sudo cat /home/$username/id_rsa.pub)
  curl -u "$github_username:$github_password" --data '{"title":"viewzr-dev-vm", "key":$KEY}' https://github.com/user/Keys
  echo "SSH Keys successfully copied into github..."
}

function main {
  create_user
  create_ssh_keys
  copy_ssh_keys
}

main
