#!/bin/bash
# ============================================
# UFW Firewall Configuration Script
# Task 2: Basic Firewall Configuration
# Date: 2026-06-15
# System: Kali Linux 2025.3
# ============================================

echo "Starting UFW Firewall Configuration..."

# Step 1: Update packages
echo "[*] Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Step 2: Install UFW
echo "[*] Installing UFW..."
sudo apt install ufw -y

# Step 3: Enable UFW
echo "[*] Enabling UFW Firewall..."
sudo ufw enable

# Step 4: Set Default Policies
echo "[*] Setting default policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Step 5: Allow SSH (Port 22)
echo "[*] Allowing SSH on port 22..."
sudo ufw allow ssh

# Step 6: Deny HTTP (Port 80)
echo "[*] Denying HTTP on port 80..."
sudo ufw deny http

# Step 7: Allow HTTPS (Port 443)
echo "[*] Allowing HTTPS on port 443..."
sudo ufw allow https

# Step 8: Check Firewall Status
echo "[*] Checking UFW Status..."
sudo ufw status verbose

echo "============================================"
echo "UFW Firewall Configuration Completed!"
echo "============================================"
echo "Rules Applied:"
echo "  - SSH  (22/tcp)  : ALLOW IN"
echo "  - HTTP (80/tcp)  : DENY IN"
echo "  - HTTPS (443)    : ALLOW IN"
echo "============================================"
