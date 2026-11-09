#!/usr/bin/env bash
set -euo pipefail

# Example UFW firewall setup for a secure Linux lab environment.
# Run with sudo.

sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH only if needed
# sudo ufw allow 22/tcp

# Allow HTTP and HTTPS if this host is hosting a web service
# sudo ufw allow 80/tcp
# sudo ufw allow 443/tcp

# Optional: allow DNS queries out
sudo ufw allow out 53

# Enable firewall
sudo ufw enable
sudo ufw status verbose
