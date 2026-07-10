#!/bin/bash

# Get memory info in MB
TOTAL_MEM=$(sysctl -n hw.memsize | awk '{printf "%.0f", $1/1024/1024/1024}')

# Get memory pressure statistics
MEMORY_STATS=$(vm_stat)

# Extract page counts
PAGES_FREE=$(echo "$MEMORY_STATS" | grep "Pages free" | awk '{print $3}' | tr -d '.')
PAGES_ACTIVE=$(echo "$MEMORY_STATS" | grep "Pages active" | awk '{print $3}' | tr -d '.')
PAGES_INACTIVE=$(echo "$MEMORY_STATS" | grep "Pages inactive" | awk '{print $3}' | tr -d '.')
PAGES_SPECULATIVE=$(echo "$MEMORY_STATS" | grep "Pages speculative" | awk '{print $3}' | tr -d '.')
PAGES_WIRED=$(echo "$MEMORY_STATS" | grep "Pages wired down" | awk '{print $4}' | tr -d '.')
PAGES_COMPRESSED=$(echo "$MEMORY_STATS" | grep "Pages occupied by compressor" | awk '{print $5}' | tr -d '.')

# Calculate used memory (active + wired + compressed)
PAGE_SIZE=4096
USED_MEM=$(echo "$PAGES_ACTIVE $PAGES_WIRED $PAGES_COMPRESSED $PAGE_SIZE" | awk '{printf "%.1f", ($1 + $2 + $3) * $4 / 1024 / 1024 / 1024}')

# Calculate percentage
MEM_PERCENT=$(echo "$USED_MEM $TOTAL_MEM" | awk '{printf "%.0f", ($1 / $2) * 100}')

sketchybar --set $NAME label="${MEM_PERCENT}%"
