# Requires i3lock-color: https://github.com/Raymo111/i3lock-color

# # catppuccin-latte
# COLOR_BASE="eff1f5ff"
# COLOR_BLUE="1e66f5ff"
# COLOR_FLAMINGO="dd7878ff"
# COLOR_GREEN="40a02bff"
# COLOR_RED="d20f39ff"
# COLOR_SKY="04a5e5ff"
# COLOR_TEAL="179299ff"
# COLOR_TEXT="4c4f69ff"

# catppuccin-macchiato
COLOR_BASE="24273aff"
COLOR_BLUE="8aadf4ff"
COLOR_FLAMINGO="dd7878ff"
COLOR_GREEN="40a02bff"
COLOR_MAUVE="c6a0f6ff"
COLOR_PINK="f5bde6ff"
COLOR_LAVENDER="b7bdf8ff"
COLOR_RED="d20f39ff"
COLOR_ROSEWATER="f4dbd6ff"
COLOR_SKY="91d7e3ff"
COLOR_TEAL="8bd5caff"
COLOR_TEXT="cad3f5ff"

i3lock \
    --blur=5 \
    --clock \
    --date-str="%a, %m-%d" \
    --ignore-empty-password \
    --pass-media-keys --pass-screen-keys --pass-power-keys --pass-volume-keys \
    --show-failed-attempts \
    --inside-color="$COLOR_BASE" --ring-color="$COLOR_TEAL" \
    --insidever-color="$COLOR_BLUE" --ringver-color="$COLOR_SKY" \
    --insidewrong-color="$COLOR_RED" --ringwrong-color="$COLOR_ROSEWATER" \
    --keyhl-color="$COLOR_GREEN" --bshl-color="$COLOR_RED" \
    --layout-color="$COLOR_TEXT" --time-color="$COLOR_TEXT" --date-color="$COLOR_TEXT" --greeter-color="$COLOR_TEXT" \
    --verif-color="$COLOR_TEXT" --wrong-color="$COLOR_TEXT" --modif-color="$COLOR_TEXT" \
    --timeoutline-width="1" --timeoutline-color="$COLOR_BASE" \
    ;
