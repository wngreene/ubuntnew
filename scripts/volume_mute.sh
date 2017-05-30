#!/usr/bin/env bash

# Get currently running audio sink.
audio_sink=`pactl list short | grep RUNNING | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,'`

# Mute audio.
pactl set-sink-mute $audio_sink toggle
