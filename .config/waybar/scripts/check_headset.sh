#!/bin/sh



if TXT=$(headsetcontrol -b | grep -E 'Battery: [0-9]+%')
then
    printf "{\"text\": \"%s%%\"}" $(echo $TXT | sed -E 's/Battery: ([0-9]+)%/\1/')
else
    if _=$(headsetcontrol -b | grep -E 'Battery: Charging')
    then
        printf '{"text": "⚡", "class": "charging"}'
    else
        printf '{"text": "💤", "class": "offline"}'
    fi
fi