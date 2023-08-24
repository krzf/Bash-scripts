#!/bin/bash

function color() {
  case $1 in
    "1") echo 7 ;;   # white
    "2") echo 1 ;;   # red
    "3") echo 2 ;;   # green
    "4") echo 3 ;;   # blue
    "5") echo 5 ;;   # purple
    "6") echo 0 ;;   # black
    *) echo "" ;;
  esac
}

function get_color_name() {
  case $1 in
    "1") echo "white" ;;
    "2") echo "red" ;;
    "3") echo "green" ;;
    "4") echo "blue" ;;
    "5") echo "purple" ;;
    "6") echo "black" ;;
    *) echo "" ;;
  esac
}

def_bg1="6"    
def_font1="1"    
def_bg2="2"    
def_font2="4"    

config_file="config.txt"
if [ -f "$config_file" ]; then
  while IFS='=' read -r key value; do
    # echo "$key $value"
    if [[ ! -z "$key" && ! -z "$value" ]]; then
      case $key in
        "column1_background") bg_color1="$value" ;;
        "column1_font_color") font_color1="$value" ;;
        "column2_background") bg_color2="$value" ;;
        "column2_font_color") font_color2="$value" ;;
      esac
    fi
  done < "$config_file"

fi

default_print_colors="0"

if [ -z "$bg_color1" ] || [ -z "$font_color1" ] || [ -z "$bg_color2" ] || [ -z "$font_color2" ]; then
  bg_color1=$def_bg1
  font_color1=$def_font1
  bg_color2=$def_bg2
  font_color2=$def_font2
  default_print_colors="1"
fi

echo $bg_color1 $font_color1 $bg_color2 $font_color2

bg_arg1="\e[4$(color $bg_color1)m"
font_arg1="\e[3$(color $font_color1)m"
bg_arg2="\e[4$(color $bg_color2)m"
font_arg2="\e[3$(color $font_color2)m"