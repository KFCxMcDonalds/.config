#!/bin/bash

sketchybar --add item net_down right \
  --set net_down update_freq=2 \
  icon= \
  padding_left=0 \
  script="$PLUGIN_DIR/network_rates.sh"

sketchybar --add item net_up right \
  --set net_up update_freq=2 \
  icon= \
  padding_left=0
