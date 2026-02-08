#!/bin/bash

INTERNAL="eDP-1"
EXTERNAL="HDMI-1"
STATE_FILE="/tmp/monitor_mode"

if [[ ! -f "$STATE_FILE" ]]; then
  echo "extended" >"$STATE_FILE"
fi

CURRENT_MODE=$(cat "$STATE_FILE")

case "$CURRENT_MODE" in
"extended")
  xrandr --output "$INTERNAL" --auto --primary --output "$EXTERNAL" --auto --left-of "$INTERNAL"
  echo "CLONED" >"$STATE_FILE"
  ;;
"CLONED")
  xrandr --output "$INTERNAL" --auto --output "$EXTERNAL" --auto --same-as "$INTERNAL"
  echo "EXTERNAL" >"$STATE_FILE"
  ;;
"EXTERNAL")
  xrandr --output "$INTERNAL" --off --output "$EXTERNAL" --auto --primary
  echo "INTERNAL" >"$STATE_FILE"
  ;;
"INTERNAL")
  xrandr --output "$INTERNAL" --auto --primary --output "$EXTERNAL" --off
  echo "extended" >"$STATE_FILE"
  ;;
*)
  xrandr --output "$INTERNAL" --auto --primary --output "$EXTERNAL" --auto --left-of "$INTERNAL"
  echo "extended" >"$STATE_FILE"
  ;;
esac

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar on every connected monitor
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  MONITOR=$m polybar --reload bar1 &
done
