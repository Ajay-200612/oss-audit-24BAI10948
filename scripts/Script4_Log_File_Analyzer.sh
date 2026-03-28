#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Ajay Jangra
# ============================================================

LOGFILE=$1
KEYWORD=${2:-"error"}

echo "=============================================================="
echo "                LOG FILE ANALYZER"
echo "=============================================================="
echo ""

# --- Check input ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: ./script4.sh <logfile> [keyword]"
    exit 1
fi

# --- Check file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File not found!"
    exit 1
fi

echo "Log File : $LOGFILE"
echo "Keyword  : $KEYWORD"
echo ""

# --- Count occurrences ---
TOTAL_LINES=$(wc -l < "$LOGFILE")
MATCH_COUNT=$(grep -i "$KEYWORD" "$LOGFILE" | wc -l)

echo "Total Lines      : $TOTAL_LINES"
echo "Matches Found    : $MATCH_COUNT"
echo ""

echo "---------------- LAST 5 MATCHES ----------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5

echo ""

echo "---------------- TOP 5 FREQUENT WORDS ----------------"
grep -i "$KEYWORD" "$LOGFILE" | \
awk '{for(i=1;i<=NF;i++) print tolower($i)}' | \
sort | uniq -c | sort -nr | head -5

echo ""

echo "=============================================================="