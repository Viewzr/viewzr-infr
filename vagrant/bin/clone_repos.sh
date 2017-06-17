#!/bin/bash

REPOS=("viewzr-infr")

function clone_repos {
  echo "Cloning repos..."
  for repo in ${REPOS[@]}; do
    git clone git@github.com:Viewzr/$repo.git
  done
  echo "Repos cloned..."
}

function set_up_env {
  mkdir -p ~/git/
  cd ~/git/
}

function main {
  set_up_env
  clone_repos
}

main
