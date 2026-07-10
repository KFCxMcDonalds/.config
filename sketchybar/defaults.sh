#!/bin/bash

default=(
  padding_left=3
  padding_right=3
  icon.font="Hack Nerd Font:Bold:16.0"
  label.font="Hack Nerd Font:Bold:13.0"
  icon.color="$ACCENT_COLOR"
  label.color="$ACCENT_COLOR"
  icon.padding_left=4
  icon.padding_right=4
  label.padding_left=4
  label.padding_right=4
  background.color="$ITEM_BG_COLOR"
  background.corner_radius=5
  background.height=15
  background.drawing=off
)

sketchybar --default "${default[@]}"

sketchybar --add event display_volume_change
