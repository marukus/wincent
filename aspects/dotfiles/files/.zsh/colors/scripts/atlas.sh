#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Atlas 
# Scheme author: Alex Lende (https://ajlende.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export BASE24_THEME="atlas"

color00="00/26/35" # Base 00 - Black
color01="ff/5a/67" # Base 08 - Red
color02="7f/c0/6e" # Base 0B - Green
color03="ff/cc/1b" # Base 0A - Yellow
color04="14/74/7e" # Base 0D - Blue
color05="9a/70/a4" # Base 0E - Magenta
color06="5d/d7/b9" # Base 0C - Cyan
color07="e6/e6/dc" # Base 06 - White
color08="51/7F/8D" # Base 02 - Bright Black
color09="ff/5a/67" # Base 12 - Bright Red
color10="7f/c0/6e" # Base 14 - Bright Green
color11="ff/cc/1b" # Base 13 - Bright Yellow
color12="14/74/7e" # Base 16 - Bright Blue
color13="9a/70/a4" # Base 17 - Bright Magenta
color14="5d/d7/b9" # Base 15 - Bright Cyan
color15="fa/fa/f8" # Base 07 - Bright White
color16="f0/8e/48" # Base 09
color17="c4/30/60" # Base 0F
color18="00/38/4d" # Base 01
color19="51/7F/8D" # Base 02
color20="86/96/96" # Base 04
color21="e6/e6/dc" # Base 06
color_foreground="a1/a1/9a" # Base 05
color_background="00/26/35" # Base 00


if [ -z "$TTY" ] && ! TTY=$(tty); then
  put_template() { true; }
  put_template_var() { true; }
  put_template_custom() { true; }
elif [ -n "$TMUX" ] || [ "${TERM%%[-.]*}" = "tmux" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ "$1" -lt 16 ] && printf "\e]P%x%s" "$1" "$(echo "$2" | sed 's/\///g')" > "$TTY"; }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033]%s%s\033\\' "$@" > "$TTY"; }
fi

# 16 color space
put_template 0  "$color00"
put_template 1  "$color01"
put_template 2  "$color02"
put_template 3  "$color03"
put_template 4  "$color04"
put_template 5  "$color05"
put_template 6  "$color06"
put_template 7  "$color07"
put_template 8  "$color08"
put_template 9  "$color09"
put_template 10 "$color10"
put_template 11 "$color11"
put_template 12 "$color12"
put_template 13 "$color13"
put_template 14 "$color14"
put_template 15 "$color15"

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg a1a19a # foreground
  put_template_custom Ph 002635 # background
  put_template_custom Pi a1a19a # bold color
  put_template_custom Pj 517F8D # selection color
  put_template_custom Pk a1a19a # selected text color
  put_template_custom Pl a1a19a # cursor
  put_template_custom Pm 002635 # cursor text
else
  put_template_var 10 "$color_foreground"
  if [ "$BASE24_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 "$color_background"
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 "$color_background" # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset put_template
unset put_template_var
unset put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color15
unset color_foreground
unset color_background

# Optionally export variables
if [ -n "$TINTED_SHELL_ENABLE_BASE24_VARS" ]; then
  export BASE24_COLOR_00_HEX="002635"
  export BASE24_COLOR_01_HEX="00384d"
  export BASE24_COLOR_02_HEX="517F8D"
  export BASE24_COLOR_03_HEX="6C8B91"
  export BASE24_COLOR_04_HEX="869696"
  export BASE24_COLOR_05_HEX="a1a19a"
  export BASE24_COLOR_06_HEX="e6e6dc"
  export BASE24_COLOR_07_HEX="fafaf8"
  export BASE24_COLOR_08_HEX="ff5a67"
  export BASE24_COLOR_09_HEX="f08e48"
  export BASE24_COLOR_0A_HEX="ffcc1b"
  export BASE24_COLOR_0B_HEX="7fc06e"
  export BASE24_COLOR_0C_HEX="5dd7b9"
  export BASE24_COLOR_0D_HEX="14747e"
  export BASE24_COLOR_0E_HEX="9a70a4"
  export BASE24_COLOR_0F_HEX="c43060"
  export BASE24_COLOR_10_HEX="002635"
  export BASE24_COLOR_11_HEX="002635"
  export BASE24_COLOR_12_HEX="ff5a67"
  export BASE24_COLOR_13_HEX="ffcc1b"
  export BASE24_COLOR_14_HEX="7fc06e"
  export BASE24_COLOR_15_HEX="5dd7b9"
  export BASE24_COLOR_16_HEX="14747e"
  export BASE24_COLOR_17_HEX="9a70a4"
fi
