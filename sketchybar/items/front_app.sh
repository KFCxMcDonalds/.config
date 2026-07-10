#!/bin/bash

sketchybar --add item front_app left \
  --set front_app background.color="$BACKGROUND" \
  background.height=19 \
  background.corner_radius=7 \
  icon.color="$HIGHLIGHT_TEXT_COLOR" \
  icon.font="sketchybar-app-font:Regular:13.0" \
  icon.y_offset=1 \
  label.color="$HIGHLIGHT_TEXT_COLOR" \
  label.y_offset=1 \
  script="$PLUGIN_DIR/front_app.sh" \
  --subscribe front_app front_app_switched
