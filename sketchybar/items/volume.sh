#!/bin/bash

sketchybar --add item volume right \
  --set volume script="$PLUGIN_DIR/volume.sh" \
  click_script="$PLUGIN_DIR/volume_click.sh" \
  --subscribe volume volume_change display_volume_change
