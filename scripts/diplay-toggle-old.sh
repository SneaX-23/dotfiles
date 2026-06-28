#!/bin/bash
INTERNAL="eDP-1"
EXTERNAL="HDMI-1"
STATE_FILE="/tmp/monitor_mode"

if [[ ! -f "$STATE_FILE" ]]; then
  echo "EXTERNAL" >"$STATE_FILE"
fi

CURRENT_MODE=$(cat "$STATE_FILE")

case "$CURRENT_MODE" in
"extended")
  hyprctl keyword monitor "$INTERNAL,preferred,auto,1"
  hyprctl keyword monitor "$EXTERNAL,preferred,auto,1,1920x0"
  echo "CLONED" >"$STATE_FILE"
  ;;
"CLONED")
  hyprctl keyword monitor "$INTERNAL,preferred,auto,1"
  hyprctl keyword monitor "$EXTERNAL,clone,$INTERNAL"
  echo "EXTERNAL" >"$STATE_FILE"
  ;;
"EXTERNAL")
  hyprctl keyword monitor "$INTERNAL,disable"
  hyprctl keyword monitor "$EXTERNAL,preferred,auto,1"
  echo "INTERNAL" >"$STATE_FILE"
  ;;
"INTERNAL")
  hyprctl keyword monitor "$INTERNAL,preferred,auto,1"
  hyprctl keyword monitor "$EXTERNAL,disable"
  echo "extended" >"$STATE_FILE"
  ;;
*)
  hyprctl keyword monitor "$INTERNAL,preferred,auto,1"
  hyprctl keyword monitor "$EXTERNAL,preferred,auto,1,1920x0"
  echo "extended" >"$STATE_FILE"
  ;;
esac

hyprctl dispatch reload   
