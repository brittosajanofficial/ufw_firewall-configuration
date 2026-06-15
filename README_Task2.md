# Task 2: Basic Firewall Configuration with UFW

## Objective
Set up a basic firewall using UFW (Uncomplicated Firewall) on a Linux system to allow SSH and deny HTTP traffic.

---

## Tools Used
- **UFW** (Uncomplicated Firewall)
- **Operating System:** Kali Linux 2025.3 (x64)
- **Platform:** Oracle VirtualBox

---

## What is UFW?
UFW (Uncomplicated Firewall) is a user-friendly frontend for managing iptables firewall rules on Linux. It is designed to make firewall configuration simple and easy for beginners while still being powerful enough for advanced use.

---

## Installation Steps

### Step 1: Update System
```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install UFW
```bash
sudo apt install ufw -y
```

### Step 3: Enable UFW
```bash
sudo ufw enable
```

### Step 4: Set Default Policies
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

### Step 5: Allow SSH (Port 22)
```bash
sudo ufw allow ssh
```

### Step 6: Deny HTTP (Port 80)
```bash
sudo ufw deny http
```

### Step 7: Allow HTTPS (Port 443)
```bash
sudo ufw allow https
```

### Step 8: Verify Configuration
```bash
sudo ufw status verbose
```

---

## Firewall Rules Configured

| Port | Protocol | Service | Action | Reason |
|------|----------|---------|--------|--------|
| 22 | TCP | SSH | ALLOW IN | Remote access to the system |
| 80 | TCP | HTTP | DENY IN | Block unencrypted web traffic |
| 443 | TCP | HTTPS | ALLOW IN | Allow encrypted web traffic |
| 22 | TCP (v6) | SSH | ALLOW IN | IPv6 remote access |
| 80 | TCP (v6) | HTTP | DENY IN | Block IPv6 unencrypted traffic |
| 443 | (v6) | HTTPS | ALLOW IN | Allow IPv6 encrypted traffic |

---

## UFW Status Output

```
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
New profiles: skip

To             Action      From
--             ------      ----
22/tcp         ALLOW IN    Anywhere
80/tcp         DENY IN     Anywhere
443            ALLOW IN    Anywhere
22/tcp (v6)    ALLOW IN    Anywhere (v6)
80/tcp (v6)    DENY IN     Anywhere (v6)
443 (v6)       ALLOW IN    Anywhere (v6)
```

---

## Explanation of Each Rule

### ✅ Port 22 — SSH (ALLOW)
- **What is SSH?** Secure Shell — used for remote login and administration of Linux systems.
- **Why Allow?** Administrators need SSH access to manage the server remotely.
- **Security Note:** Always use SSH key authentication instead of passwords for better security.

### ❌ Port 80 — HTTP (DENY)
- **What is HTTP?** HyperText Transfer Protocol — used for unencrypted web traffic.
- **Why Deny?** HTTP transmits data in plain text, making it vulnerable to eavesdropping and man-in-the-middle attacks.
- **Security Note:** Blocking HTTP forces users to use the more secure HTTPS protocol.

### ✅ Port 443 — HTTPS (ALLOW)
- **What is HTTPS?** HTTP Secure — encrypted version of HTTP using SSL/TLS.
- **Why Allow?** Allows secure, encrypted web traffic to pass through the firewall.
- **Security Note:** HTTPS protects data in transit using encryption.

---

## Default Policies Explained

| Policy | Value | Meaning |
|--------|-------|---------|
| Incoming | DENY | Block all incoming traffic by default |
| Outgoing | ALLOW | Allow all outgoing traffic by default |
| Routed | DISABLED | No packet forwarding |

Setting **default deny incoming** is a best practice — it blocks everything unless explicitly allowed.

---

## Security Recommendations

1. **Always keep UFW enabled** on production systems.
2. **Never allow port 23 (Telnet)** — it sends data in plain text.
3. **Limit SSH access** by allowing only specific IPs:
   ```bash
   sudo ufw allow from 192.168.1.0/24 to any port 22
   ```
4. **Regularly review firewall rules:**
   ```bash
   sudo ufw status numbered
   ```
5. **Enable UFW logging** to monitor suspicious activity:
   ```bash
   sudo ufw logging on
   ```

---

## Screenshots
![UFW Status Output](ufw_screenshot.jpg)

---

## Files in This Repository

| File | Description |
|------|-------------|
| `ufw_configuration.sh` | Shell script to automate UFW setup |
| `README.md` | Full explanation of firewall configuration |
| `ufw_screenshot.jpg` | Screenshot of UFW status output |

---

## Conclusion
This task successfully configured a basic firewall using UFW on Kali Linux. The firewall was set up to allow SSH (port 22) for remote administration and HTTPS (port 443) for secure web traffic, while denying HTTP (port 80) to prevent unencrypted connections. The default deny incoming policy ensures the system is protected against unauthorized access.
