#!/bin/bash

# yabai spaces configuration
SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  space=(
    space=$sid
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=7
    icon.padding_right=4
    padding_right=0
    label.padding_right=7
    label.font="sketchybar-app-font:Regular:13.0"
    background.color="$BACKGROUND"
    icon.color="$ACCENT_COLOR"
    label.color="$ACCENT_COLOR"
    background.corner_radius=7
    background.height=19
    background.drawing=off
    label.drawing=on
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid left \
             --set space.$sid "${space[@]}" \
             click_script="yabai -m space --focus $sid" \
             --subscribe space.$sid space_change

done

sketchybar --add item space_separator left \
  --set space_separator icon="|" \
  icon.color="$ACCENT_COLOR" \
  icon.padding_left=4 \
  icon.padding_right=7 \
  label.drawing=off \
  background.drawing=off
