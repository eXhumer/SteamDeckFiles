#!/bin/bash

# Check if script is not running as root
if [[ $EUID > 0 ]]; then
  echo "Please run as root"
  sleep 3
  exit
else
  # Disable SteamOS readonly mode
  steamos-readonly disable

  # Initialize and populate pacman keyring
  pacman-key --init
  pacman-key --populate archlinux holo

  # Sync / refresh packages
  pacman -Sy

  # Install base-devel
  pacman -S --noconfirm base-devel

  # Remove old steamtinkerlaunch
  rm -rf /home/deck/steamtinkerlaunch

  # Clone latest steamtinkerlaunch from GitHub
  git clone https://github.com/sonic2kk/steamtinkerlaunch.git /home/deck/steamtinkerlaunch

  # Change directory to cloned steamtinkerlaunch
  cd /home/deck/steamtinkerlaunch/

  # Install steamtinkerlaunch
  make install

  # Add steamtinkerlaunch as Steam compatibility tool
  sudo -u deck DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u deck)/bus steamtinkerlaunch compat add

  # Enable SteamOS readonly mode
  steamos-readonly enable

  sleep 3
fi
