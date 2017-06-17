#!/bin/bash

LOG_FILE=/var/log/viewzr/install/install.log
FIREFOX=https://download.mozilla.org/?product=firefox-54.0-SSL&os=linux64&lang=en-US

function set_up_logs {
  sudo mkdir -p /var/log/viewzr/install/
  cat <<- EOF | sudo tee install.log
  This is the start of the viewzr developer environment install log...
}

function install_travis {
  echo "Installing travis-cli..."
  gem install travis -v 1.8.8 --no-rdoc --no-ri >> $LOG_FILE 2>&1
  echo "Travis install successful..."
}

function install_firefox {
  echo "Installing firefox browser..."
  wget $FIREFOX | tar xvzf -C /opt/ >> $LOG_FILE 2>&1
  sudo ln -s /opt/firefox-54.0/firefox /usr/local/bin/firefox/ >> $LOG_FILE 2>&1
  (cat <<- EOF | sudo tee /usr/share/applications/firefox.desktop
  #!/usr/bin/env xdg-open >

  [Desktop Entry]
  Version=1.0
  Encoding=UTF-8
  Name=Firefox Web Browser
  Exec=firefox %u -new-tab www.google.com
  Icon=firefox
  Terminal=false
  Type=Application
  StartupWMClass=Firefox-bin
  MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;
  StartupNotify=true
  X-Desktop-File-Install-Version=0.15
  Categories=Network;WebBrowser;) >> $LOG_FILE 2>&1

  echo "Firefox was successfully installed..."
}

function install_git {
  echo "Installing git/gitk..."
  sudo dnf install --enablerepo=base --assumeyes git gitk >> $LOG_FILE 2>&1
  echo "Git was installed successfully..."
}

function install_ruby {
  echo "Installing ruby..."
  sudo dnf install --enablerepo=base --assumeyes ruby ruby-devel >> $LOG_FILE 2>&1
  echo "Ruby was installed successfully..."
}

function install_node {
  echo "Installing node v7..."
  sudo curl -sL https://rpm.nodesource.com/setup_7.x | sudo bash - >> $LOG_FILE 2>&1
  echo "Latest node installed..."
}

function main {
  set_up_logs
  install_git
  install_ruby
  install_node
  install_travis
  install_firefox
}

main
