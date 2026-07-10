#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Async function to update icons in background
update_icons_async() {
  local space_id=$1
  local space_name=$2
  local is_focused=$3

  # Get windows in this space
  WINDOWS=$(yabai -m query --windows --space $space_id 2>/dev/null)

  # Generate icons for apps in this space
  icons=""
  if [ -n "$WINDOWS" ]; then
    for app in $(echo "$WINDOWS" | jq -r '.[].app'); do
      icon=$("$CONFIG_DIR/plugins/icon_map_fn.sh" "$app")
      if [ -n "$icon" ]; then
        icons+="$icon "
      fi
    done
  fi

  # Update the label with icons
  if [ "$is_focused" = "true" ]; then
    sketchybar --set $space_name label="$icons"
  else
    if [ -n "$icons" ]; then
      sketchybar --set $space_name label="$icons"
    else
      sketchybar --set $space_name label=""
    fi
  fi
}

# Get current space info from yabai
if [ "$SENDER" = "space_change" ]; then
  SPACE_ID=$(echo "$INFO" | jq -r '.space')
  CURRENT_SPACE=$(yabai -m query --spaces --space | jq -r '.index')

  # Check if this is the focused space
  if [ "$SID" = "$CURRENT_SPACE" ]; then
    # Immediately update visual state (fast response)
    sketchybar --set $NAME \
      background.drawing=on \
      icon.color="$HIGHLIGHT_TEXT_COLOR" \
      label.color="$HIGHLIGHT_TEXT_COLOR" \
      background.color="$BACKGROUND"

    # Load icons asynchronously in background
    update_icons_async "$SID" "$NAME" "true" &
  else
    # Immediately update visual state (fast response)
    sketchybar --set $NAME \
      background.drawing=off \
      icon.color="$ACCENT_COLOR" \
      label.color="$ACCENT_COLOR"

    # Load icons asynchronously in background
    update_icons_async "$SID" "$NAME" "false" &
  fi
else
  # Initial setup - check if space is focused
  CURRENT_SPACE=$(yabai -m query --spaces --space | jq -r '.index')

  if [ "$SID" = "$CURRENT_SPACE" ]; then
    # Immediately update visual state
    sketchybar --set $NAME \
      background.drawing=on \
      icon.color="$HIGHLIGHT_TEXT_COLOR" \
      label.color="$HIGHLIGHT_TEXT_COLOR" \
      background.color="$BACKGROUND"

    # Load icons asynchronously
    update_icons_async "$SID" "$NAME" "true" &
  else
    # Load icons asynchronously for inactive spaces too
    update_icons_async "$SID" "$NAME" "false" &
  fi
fi
