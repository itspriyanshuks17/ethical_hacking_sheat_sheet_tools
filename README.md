# 🛡️Ethical Hacking CLI Toolkit

## 📄 PDF Cheat Sheet Download

✅ **[Download the Full Command-Line Ethical Hacking Cheat Sheet (PDF)](sandbox:/mnt/data/Advanced_Ethical_Hacking_Cheat_Sheet.pdf)**

Includes categorized commands, syntax, and usage examples for:
- Network Scanning
- Brute Force Attacks
- Enumeration
- Reverse Shells
- Privilege Escalation
- Post Exploitation
- Web Enumeration

---

## 🧰 Tool Categories

### 🌐 Network Discovery & Scanning
- `nmap` – Port scanning and service enumeration
- `fping` – Fast ping sweeper
- `masscan` – High-speed port scanner
- `zmap` – Internet-wide scanning tool

### 🧠 Enumeration & Recon
- `whois`, `nslookup`, `dig` – DNS & domain recon
- `nikto` – Web server vulnerability scanner
- `censys` – Internet-wide host analysis

### 🔓 Brute Force Attacks
- `hydra` – Versatile password cracker
- `patator` – Multi-protocol brute-force tool
- `ncrack` – Network authentication cracking

### 🗃️ File & Data Analysis
- `binwalk`, `foremost` – File carving and binary analysis
- `bulk_extractor`, `xxd` – Data extraction and hex viewing
- `grep`, `find`, `cut`, `awk`, `sed` – Data processing

### 🐚 Reverse Shells & Exploitation
- `msfvenom` – Payload generator (Metasploit)
- `socat`, `netcat`, `openssl` – Encrypted and raw reverse shells

### 🧗 Privilege Escalation
- `getcap`, `capsh` – Linux capabilities check
- `pspy` – Monitor processes without root
- `searchsploit` – Search for local exploits
- `GTFOBins` – Find escalation methods from allowed binaries

### 🔍 Web Enumeration
- `gobuster`, `dirb` – Directory brute-forcing
- `curl`, `wget` – Manual request inspection

### 🧼 Post-Exploitation
- `whoami`, `id`, `env`, `netstat`, `lsof` – Information gathering after shell access

---

## 🚩 CTF Walkthrough Example

```bash
# 1. Discover live hosts on the network
nmap -sn 192.168.1.0/24

# 2. Scan open ports on a found host
nmap -sS -sV 192.168.1.105

# 3. Access SSH (if credentials are known)
ssh student@192.168.1.105

# 4. Search for the flag
find / -type f -iname "*flag*" 2>/dev/null

# 5. Read the flag (optional)
cat /home/student/flag.txt

# 6. Delete the flag (as per challenge rule)
rm /home/student/flag.txt
```

---

## 💻 How to Practice

- 🧪 Use VMs like Metasploitable2, TryHackMe, or VulnHub
- 🧱 Practice in terminal-only environments using tmux, SSH, and headless setups
- ⚠️ No GUI tools allowed — simulate the competition environment

---

## 🏁 Tips for the Competition

- Be fast, but **accurate** — deleting the wrong file will cost you
- Follow **proper command syntax** — every second counts
- Stick to CLI-only tools. GUI or unauthorized tools will disqualify you

---

## ✍️ Author & License

Crafted with ❤️ by a Seamedu Cyber Arena enthusiast.

📘 For educational use only. Use these tools in legal and authorized environments.

> ❗ Unauthorized access or misuse of hacking tools is illegal and unethical.

---
