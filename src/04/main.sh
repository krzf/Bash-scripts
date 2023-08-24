#!/bin/bash

if [ "$#" -ne 0 ]; then
 echo -e "\e[1;31mError: wrong parameters"
  exit 1
fi



. help.sh
. colorsett.sh


sys


if [ "$default_print_colors" -ne "0" ]; then
  echo -e "\nColumn 1 background = default ($(get_color_name "$bg_color1"))"
  echo -e "Column 1 font color = default ($(get_color_name "$font_color1"))"
  echo -e "Column 2 background = default ($(get_color_name "$bg_color2"))"
  echo -e "Column 2 font color = default ($(get_color_name "$font_color2"))"
else
  echo -e "\nColumn 1 background = $bg_color1 ($(get_color_name $bg_color1))"
  echo -e "Column 1 font color = $font_color1 ($(get_color_name $font_color1))"
  echo -e "Column 2 background = $bg_color2 ($(get_color_name $bg_color2))"
  echo -e "Column 2 font color = $font_color2 ($(get_color_name $font_color2))"
fi