#!/bin/bash
# converts and MP3 file to the correct .wav format for deepspeech

input="./mp3/$1.mp3"
output="./wav/$(cut -d '.' -f2 <<<$1).wav"


ffmpeg -i $input -acodec pcm_s16le -ac 1 -ar 16000 $output
rm $input