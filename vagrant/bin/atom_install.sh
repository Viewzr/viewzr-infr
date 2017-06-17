#!/bin/bash

ATOM_DL=https://github.com/atom/atom/releases/download/v1.18.0/atom.x86_64.rpm

function set_up_env {
  cd ~/Downloads/
}
function install_atom {
  echo "Installing the atom IDE..."
  wget $ATOM_DL
  sudo dnf install -y atom.x86_64.rpm
  echo "Atom successfully installed..."
}

function install_atom_packages {
  echo "Installing packages for atom..."
  declare -a packages=( "platformio-ide-terminal" "line-ending-converter" "atom-jshint" )
  for package in "${packages[@]}"; do
    apm install $package
  done
  echo "Packages for atom installed..."
}

function main {
  set_up_env
  install_atom
  install_atom_packages
}

main
