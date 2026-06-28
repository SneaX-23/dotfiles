#!/bin/bash

INTERNAL="eDP-1"
EXTERNAL="HDMI-1"
STATE_FILE="/tmp/monitor_mode"

# ── helpers ──────────────────────────────────────────────────────────────────

external_connected() {
  hyprctl monitors -j | grep -q "\"name\":\"$EXTERNAL\""
}

apply_external_only() {
  hyprctl keyword monitor "$EXTERNAL,preferred,auto,1"
  hyprctl keyword monitor "$INTERNAL,disabled"
}

apply_internal_only() {
  hyprctl keyword monitor "$INTERNAL,preferred,auto,1"
  hyprctl keyword monitor "$EXTERNAL,disabled"
}

apply_extended() {
  hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"
  hyprctl keyword monitor "$EXTERNAL,preferred,1920x0,1"
}

apply_cloned() {
  # Hyprland doesn't have native clone; mirror by placing at the same offset
  # and matching resolution. Adjust 1920x1080 to your actual shared resolution.
  hyprctl keyword monitor "$INTERNAL,1920x1080@60,0x0,1"
  hyprctl keyword monitor "$EXTERNAL,1920x1080@60,0x0,1"
}

notify() {
  command -v notify-send &>/dev/null && notify-send "Monitor" "$1" --icon=display
}

# ── boot / reload entry-point ─────────────────────────────────────────────────
# Called by Hyprland's exec-once and monitor hotplug rules to enforce EXTERNAL.

if [[ "$1" == "--init" ]]; then
  if external_connected; then
    apply_external_only
    echo "EXTERNAL" >"$STATE_FILE"
    notify "External only"
  else
    apply_internal_only
    echo "INTERNAL" >"$STATE_FILE"
    notify "Internal only (no external detected)"
  fi
  exit 0
fi

# ── toggle cycle ──────────────────────────────────────────────────────────────

CURRENT_MODE=$(cat "$STATE_FILE" 2>/dev/null || echo "EXTERNAL")

if ! external_connected; then
  apply_internal_only
  echo "INTERNAL" >"$STATE_FILE"
  notify "Internal only (external not connected)"
  exit 0
fi

case "$CURRENT_MODE" in
EXTERNAL)
  apply_internal_only
  echo "INTERNAL" >"$STATE_FILE"
  notify "Internal only"
  ;;
INTERNAL)
  apply_extended
  echo "EXTENDED" >"$STATE_FILE"
  notify "Extended"
  ;;
EXTENDED)
  apply_cloned
  echo "CLONED" >"$STATE_FILE"
  notify "Cloned"
  ;;
CLONED | *)
  apply_external_only
  echo "EXTERNAL" >"$STATE_FILE"
  notify "External only"
  ;;
esac
