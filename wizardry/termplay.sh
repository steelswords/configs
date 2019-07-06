#!/bin/bash
export CACA_LIB=ncurses
if [[ -z "$1" ]] ; then 
  echo "Usage: $0 <videofile>"
  exit
fi

mplayer -really-quiet -vo caca "$1"
