#!/usr/bin/env sh

set -eu

MONITORS_JSON="$(hyprctl monitors -j)"

internal="$(printf '%s' "$MONITORS_JSON" | jq -r '.[] | select(.name | test("^(eDP|LVDS)")) | .name' | head -n1)"

if [ -z "${internal:-}" ] || [ "$internal" = "null" ]; then
  internal="$(printf '%s' "$MONITORS_JSON" | jq -r '.[0].name')"
fi

external="$(printf '%s' "$MONITORS_JSON" | jq -r --arg internal "$internal" '.[] | select(.name != $internal and .disabled == false) | .name' | head -n1)"

if [ -z "${external:-}" ] || [ "$external" = "null" ]; then
  notify-send "Displays" "No external monitor detected."
  exit 1
fi

internal_width="$(printf '%s' "$MONITORS_JSON" | jq -r --arg name "$internal" '.[] | select(.name == $name) | .width')"
internal_x="$(printf '%s' "$MONITORS_JSON" | jq -r --arg name "$internal" '.[] | select(.name == $name) | .x')"
internal_y="$(printf '%s' "$MONITORS_JSON" | jq -r --arg name "$internal" '.[] | select(.name == $name) | .y')"
external_width="$(printf '%s' "$MONITORS_JSON" | jq -r --arg name "$external" '.[] | select(.name == $name) | .width')"

if [ -z "${external_width:-}" ] || [ "$external_width" = "null" ]; then
  external_width=1920
fi

choice="$(
  printf '%s\n' \
    "Extend Right" \
    "Extend Left" \
    "Mirror Internal" \
    "Internal Only" \
    "External Only" |
    rofi -dmenu -i -p "Displays"
)"

[ -n "${choice:-}" ] || exit 0

case "$choice" in
  "Extend Right")
    hyprctl keyword monitor "$internal,preferred,0x0,1"
    hyprctl keyword monitor "$external,preferred,${internal_width}x0,1"
    ;;
  "Extend Left")
    hyprctl keyword monitor "$external,preferred,-${external_width}x0,1"
    hyprctl keyword monitor "$internal,preferred,0x0,1"
    ;;
  "Mirror Internal")
    hyprctl keyword monitor "$internal,preferred,0x0,1"
    hyprctl keyword monitor "$external,preferred,${internal_x}x${internal_y},1,mirror,$internal"
    ;;
  "Internal Only")
    hyprctl keyword monitor "$internal,preferred,0x0,1"
    hyprctl keyword monitor "$external,disable"
    ;;
  "External Only")
    hyprctl keyword monitor "$external,preferred,0x0,1"
    hyprctl keyword monitor "$internal,disable"
    ;;
  *)
    exit 1
    ;;
esac

notify-send "Displays" "$choice applied for $external"
