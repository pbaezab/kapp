#!/bin/bash

if test -z "$BASH_VERSION"; then
  echo "Please run this script using bash, not sh or any other shell." >&2
  exit 1
fi

install() {
	set -euo pipefail

	# Start Kubernetes on Katacoda
	launch.sh

	# Install ytt
	echo "Installing ytt..."
	wget -O- https://github.com/k14s/ytt/releases/download/v0.2.0/ytt-linux-amd64 > /tmp/ytt
	echo "6e6e904d0966fbfe4f6c9736b84396e86d6af9edb720caca2ad34ac243d47d52  /tmp/ytt" | shasum -c -
	mv /tmp/ytt /usr/local/bin/ytt
	chmod +x /usr/local/bin/ytt
	echo "Installed ytt"

	# Install kapp
	echo "Installing kapp..."
	wget -O- https://github.com/k14s/kapp/releases/download/v0.1.0/kapp-linux-amd64 > /tmp/kapp
	echo "95c84b7d2c40830fa72dc7ff0e6f6fc31e9c7c5ab7c2bfcae22866d2967d0c8f  /tmp/kapp" | shasum -c -
	mv /tmp/kapp /usr/local/bin/kapp
	chmod +x /usr/local/bin/kapp
	echo "Installed kapp"

	git clone https://github.com/k14s/kapp
	echo "Cloned github.com/k14s/kapp for examples"
}

install
