#!/bin/bash
# trims wav files to the given length

name="$(cut -d '.' -f2 <<<$1)"
name="$(cut -d '/' -f3 <<<$name)"

TIMESTRING="$2:00"

output="./wav/$(cut -d '.' -f2 <<<$name)_$TIMESTRING.wav"

ffmpeg -ss 00:00:00 -t $TIMESTRING -i $1 $output

echo "New file: $output"
