#!/bin/sh
set -e

PROC=$(cat /proc/cpuinfo | grep "model name" | sed -n -e 's/^model name.*: //p' | head -1)
cat >/www/device-info.js <<EOF
  mender_server = {
    "Web server": "$(hostname)",
    "Server address": "$(ip route get 1.2.3.4 | awk '{print $7}')"
  }
  mender_identity = {
    "Device ID": "",
    "mac": "$(cat /sys/class/net/eth0/address)"
  }
  mender_inventory = {
    "device_type": "intam",
    "mender_client_version": "2.0.0-beta",
    "os": "$(cat /proc/version)",
    "cpu": "$PROC",
    "kernel": "$(uname -r)"
  }
EOF
httpd -f -v
