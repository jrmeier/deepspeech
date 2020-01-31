#!/bin/bash
# converts and MP3 file to the correct .wav format for deepspeech

input="./mp3/$1.mp3"
full_output="./wav/$(cut -d '.' -f2 <<<$1)_full.wav"
segment_output="./wav/$1_split.mp3"


ffmpeg -i $input -acodec pcm_s16le -ac 1 -ar 16000 $full_output

# ffmpeg -i $input -f segment -segment_time 3 -c copy $segment_output%03d

rm $input