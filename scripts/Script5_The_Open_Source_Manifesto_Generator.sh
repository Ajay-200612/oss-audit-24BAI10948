#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Ajay Jangra
# ============================================================

# --- Function (alias concept) ---
print_line() {
    echo "======================================================"
}

# --- Welcome Screen ---
clear
print_line
echo "        OPEN SOURCE MANIFESTO GENERATOR"
print_line
echo ""

echo "Answer the following questions:"
echo ""

# --- User Input ---
read -p "1. Name one open-source tool you use daily: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. What would you like to build and share? " BUILD

echo ""

# --- Validation ---
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "Error: Please fill all inputs!"
    exit 1
fi

# --- File Setup ---
DATE=$(date '+%d %B %Y')
TIME=$(date '+%H:%M')
USER=$(whoami)
OUTPUT="manifesto_${USER}.txt"

# --- Generate Manifesto ---
echo "OPEN SOURCE MANIFESTO" > "$OUTPUT"
echo "Generated on $DATE at $TIME by $USER" >> "$OUTPUT"
echo "======================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "I use $TOOL as part of my daily work." >> "$OUTPUT"
echo "For me, freedom means $FREEDOM." >> "$OUTPUT"
echo "I believe in building tools like $BUILD and sharing them openly." >> "$OUTPUT"
echo "Open source promotes collaboration, learning, and innovation." >> "$OUTPUT"

echo "" >> "$OUTPUT"
echo "-- $USER" >> "$OUTPUT"

# --- Output ---
print_line
echo "Manifesto saved to: $OUTPUT"
print_line
echo ""

cat "$OUTPUT"

echo ""
print_line
echo "Thank you for supporting open source!"
print_line