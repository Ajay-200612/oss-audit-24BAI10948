#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Ajay Jangra
# ============================================================

# --- Variables ---
STUDENT_NAME="Ajay Jangra"
SOFTWARE="Git"

# --- System Info ---
KERNEL=$(uname -r)
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
USER=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
DATE=$(date '+%A, %d %B %Y')
TIME=$(date '+%H:%M:%S')

# --- License ---
LICENSE="GNU General Public License v2 (GPL v2)"

# --- Output ---
echo "=================================================="
echo "        SYSTEM IDENTITY REPORT"
echo "=================================================="
echo ""
echo "Student Name : $STUDENT_NAME"
echo "Software     : $SOFTWARE"
echo ""
echo "---------------- SYSTEM INFO ----------------"
echo "Distro       : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER"
echo "Home Dir     : $HOME_DIR"
echo "Uptime       : $UPTIME"
echo "Date         : $DATE"
echo "Time         : $TIME"
echo ""
echo "---------------- LICENSE ----------------"
echo "$LICENSE"
echo "=================================================="