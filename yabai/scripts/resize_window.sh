#!/bin/bash


# get window info
window_info=$(yabai -m query --windows --window)
display_info=$(yabai -m query --displays --display)
# get params
frame_x=$(echo "$window_info" | jq '.frame.x')
frame_y=$(echo "$window_info" | jq '.frame.y')
frame_w=$(echo "$window_info" | jq '.frame.w')
frame_h=$(echo "$window_info" | jq '.frame.h')
display_x=$(echo "$display_info" | jq '.frame.x')
display_y=$(echo "$display_info" | jq '.frame.y')
display_w=$(echo "$display_info" | jq '.frame.w')
display_h=$(echo "$display_info" | jq '.frame.h')

# padding: 3
case "$1" in
    left)
        if [ $(($frame_x - $display_x)) -gt 3 ]; then
            yabai -m window --resize left:-20:0
        else
            yabai -m window --resize right:20:0
        fi
        ;;
    *)
        echo "Usage: $0 {left|right|up|down}"
        exit 1
        ;;
esac

