#!/bin/bash

NAME=$1
LEN=$2
LINK=$3

TIMESTRING=""
m=00
h=00

h="$(cut -d ':' -f1 <<<$LEN)"
m="$(cut -d ':' -f2 <<<$LEN)"

TIMESTRING="$h:$m:00"

# MP3INPUT="$(curl -L $LINK)"
# echo $LINK
# CURL -L $LINK --output ./mp3/$NAME.mp3
INPUT="./mp3/$NAME.mp3"
# MP3OUTPUT="$(cut -d'.' -f2 <<<$NAME)_"$TIMESTRING".$(cut -d'.' -f1 <<<$NAME)"
MP3OUTPUT="./mp3/$(cut -d'.' -f2 <<<$NAME)_"$TIMESTRING.mp3""

# echo "Input: $INPUT"
# echo "MP3 output: $MP3OUTPUT"

WAVOUTPUT="$(cut -d'.' -f1 <<<$MP3OUTPUT).wav"
TEXTOUTPUT="$PWD/./output/$(cut -d'.' -f1 <<<$MP3OUTPUT).txt"
# echo $WAVOUTPUT
# echo $TEXTOUTPUT

# if [ $1 -gt 100 ]
# then
# echo Hey that\'s a large number.
# pwd
# fi


if [ "$LEN" != 100 ] 
then
    ffmpeg -ss 00:00:00 -t $TIMESTRING -i $INPUT $MP3OUTPUT
    echo "Hey man trim this shit"
else 
    echo "Don't trim me"
fi

ffmpeg -i $MP3OUTPUT -acodec pcm_s16le -ac 1 -ar 16000 $WAVOUTPUT
# rm $MP3OUTPUT

# deepspeech --model deepspeech-0.5.1-models/output_graph.pbmm --alphabet deepspeech-0.5.1-models/alphabet.txt --lm deepspeech-0.5.1-models/lm.binary --trie deepspeech-0.5.1-models/trie --audio $WAVOUTPUT > $TEXTOUTPUT
# rm $WAVOUTPUT