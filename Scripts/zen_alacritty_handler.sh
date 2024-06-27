#!/bin/bash

ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"
CURRENT_OPACITY=$(grep -oP 'opacity = \K[0-9.]+' $ALACRITTY_CONFIG)

change_opacity() {
  local new_opacity="$1"
  sed -i "s/opacity = $CURRENT_OPACITY/opacity = $new_opacity/" $ALACRITTY_CONFIG
}

if [ "$CURRENT_OPACITY" = "1.0" ]; then
  change_opacity "0.6"
elif [ "$CURRENT_OPACITY" = "0.6" ]; then
  change_opacity "1.0"
else
  echo "Current opacity is not 1.0 or 0.6"
fi

NEW_OPACITY=$(grep -oP 'opacity = \K[0-9.]+' $ALACRITTY_CONFIG)

