#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Ajay Jangra
# ============================================================

PACKAGE="git"

echo "=================================================="
echo "        FOSS PACKAGE INSPECTOR"
echo "=================================================="
echo ""
echo "Checking package: $PACKAGE"
echo ""

# Check if installed (Debian-based)
if command -v dpkg &>/dev/null && dpkg -l | grep -qw $PACKAGE; then

    echo "STATUS: $PACKAGE is INSTALLED"
    echo ""
    echo "------ PACKAGE DETAILS ------"

    VERSION=$(dpkg -s $PACKAGE | grep Version | cut -d':' -f2)
    echo "Version : $VERSION"
    echo "License : GPL v2"
    echo "Summary : Distributed Version Control System"

# Check if installed (generic)
elif command -v git &>/dev/null; then

    VERSION=$(git --version)
    echo "STATUS: $PACKAGE is INSTALLED (manual install)"
    echo "Version : $VERSION"

else
    echo "STATUS: $PACKAGE is NOT INSTALLED"
    echo "Install using: sudo apt install git"
fi

echo ""
echo "------ OPEN SOURCE NOTE ------"

case $PACKAGE in
    git)
        echo "Git was created by Linus Torvalds in 2005."
        echo "It was built when a proprietary tool failed the open-source community."
        echo "Today, Git powers almost all modern software development."
        ;;
    vlc)
        echo "VLC is a free multimedia player built by students."
        ;;
    firefox)
        echo "Firefox is an open-source browser focused on privacy."
        ;;
    *)
        echo "Open source software allows freedom to use, modify and share."
        ;;
esac

echo ""
echo "=================================================="