#!/usr/bin/env bash

set -e

ssh-import-id-gh SeanWallace

# Enable IP forwarding.
sysctl -w net.ipv4.ip_forward=1

# Write the firewall rules.
iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
iptables -A FORWARD -i  enp0s3 -o enp0s8 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE

# Save these rules.
apt-get update
export DEBIAN_FRONTEND=noninteractive
apt install -y iptables-persistent