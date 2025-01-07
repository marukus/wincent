#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Ayu Mirage 
# Scheme author: Khue Nguyen <Z5483Y@gmail.com>
# Template author: Tinted Theming (https://github.com/tinted-theming)
export BASE24_THEME="ayu-mirage"

color00="17/1B/24" # Base 00 - Black
color01="F2/87/79" # Base 08 - Red
color02="D5/FF/80" # Base 0B - Green
color03="FF/D1/73" # Base 0A - Yellow
color04="5C/CF/E6" # Base 0D - Blue
color05="D4/BF/FF" # Base 0E - Magenta
color06="95/E6/CB" # Base 0C - Cyan
color07="D9/D7/CE" # Base 06 - White
color08="24/29/36" # Base 02 - Bright Black
color09="F2/87/79" # Base 12 - Bright Red
color10="D5/FF/80" # Base 14 - Bright Green
color11="FF/D1/73" # Base 13 - Bright Yellow
color12="5C/CF/E6" # Base 16 - Bright Blue
color13="D4/BF/FF" # Base 17 - Bright Magenta
color14="95/E6/CB" # Base 15 - Bright Cyan
color15="F3/F4/F5" # Base 07 - Bright White
color16="FF/AD/66" # Base 09
color17="F2/9E/74" # Base 0F
color18="1F/24/30" # Base 01
color19="24/29/36" # Base 02
color20="8A/91/99" # Base 04
color21="D9/D7/CE" # Base 06
color_foreground="CC/CA/C2" # Base 05
color_background="17/1B/24" # Base 00


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
  put_template_custom Pg CCCAC2 # foreground
  put_template_custom Ph 171B24 # background
  put_template_custom Pi CCCAC2 # bold color
  put_template_custom Pj 242936 # selection color
  put_template_custom Pk CCCAC2 # selected text color
  put_template_custom Pl CCCAC2 # cursor
  put_template_custom Pm 171B24 # cursor text
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
  export BASE24_COLOR_00_HEX="171B24"
  export BASE24_COLOR_01_HEX="1F2430"
  export BASE24_COLOR_02_HEX="242936"
  export BASE24_COLOR_03_HEX="707A8C"
  export BASE24_COLOR_04_HEX="8A9199"
  export BASE24_COLOR_05_HEX="CCCAC2"
  export BASE24_COLOR_06_HEX="D9D7CE"
  export BASE24_COLOR_07_HEX="F3F4F5"
  export BASE24_COLOR_08_HEX="F28779"
  export BASE24_COLOR_09_HEX="FFAD66"
  export BASE24_COLOR_0A_HEX="FFD173"
  export BASE24_COLOR_0B_HEX="D5FF80"
  export BASE24_COLOR_0C_HEX="95E6CB"
  export BASE24_COLOR_0D_HEX="5CCFE6"
  export BASE24_COLOR_0E_HEX="D4BFFF"
  export BASE24_COLOR_0F_HEX="F29E74"
  export BASE24_COLOR_10_HEX="171B24"
  export BASE24_COLOR_11_HEX="171B24"
  export BASE24_COLOR_12_HEX="F28779"
  export BASE24_COLOR_13_HEX="FFD173"
  export BASE24_COLOR_14_HEX="D5FF80"
  export BASE24_COLOR_15_HEX="95E6CB"
  export BASE24_COLOR_16_HEX="5CCFE6"
  export BASE24_COLOR_17_HEX="D4BFFF"
fi
