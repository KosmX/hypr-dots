#!/bin/sh

if TXT=$(upsc nutdev1@localhost | grep -E 'battery\.charge: [0-9]+$')
then
    printf "󰁹%s%%" $(echo $TXT | sed -E 's/battery\.charge: ([0-9]+$)/\1/')
else
    printf "󰂃⚠️"
fi