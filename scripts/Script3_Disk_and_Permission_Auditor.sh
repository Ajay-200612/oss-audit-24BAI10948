#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Ajay Jangra
# ============================================================

# --- Directories to check ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/opt")

# --- Git config paths ---
GIT_SYS="/etc/gitconfig"
GIT_USER="$HOME/.gitconfig"

echo "=============================================================="
echo "        DISK & PERMISSION AUDITOR"
echo "=============================================================="
echo ""

# Table header
printf "%-15s %-12s %-10s %-10s %-10s\n" "Directory" "Perms" "Owner" "Group" "Size"
echo "--------------------------------------------------------------"

# --- Loop through directories ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then

        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "%-15s %-12s %-10s %-10s %-10s\n" \
        "$DIR" "$PERMS" "$OWNER" "$GROUP" "${SIZE:-N/A}"

    else
        printf "%-15s %-12s %-10s %-10s %-10s\n" \
        "$DIR" "N/A" "N/A" "N/A" "Not Found"
    fi
done

echo ""
echo "=============================================================="
echo "        GIT CONFIG FILE CHECK"
echo "=============================================================="
echo ""

# --- System config ---
if [ -f "$GIT_SYS" ]; then
    PERM=$(ls -l "$GIT_SYS" | awk '{print $1, $3, $4}')
    echo "System Config : $GIT_SYS"
    echo "Permissions   : $PERM"
else
    echo "System Config not found"
fi

echo ""

# --- User config ---
if [ -f "$GIT_USER" ]; then
    PERM=$(ls -l "$GIT_USER" | awk '{print $1, $3, $4}')
    echo "User Config   : $GIT_USER"
    echo "Permissions   : $PERM"
else
    echo "User Config not found"
fi

echo ""
echo "=============================================================="