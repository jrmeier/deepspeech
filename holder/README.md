# README

## Helpful commands
- trim a file: ```ffmpeg -ss 00:00:00 -t 00:10:00 -i input.mp3 output.mp3``` 
- convert a file: ```ffmpeg -i INPUT.mp3 -acodec pcm_s16le -ac 1 -ar 16000 out.wav```
- $ deepspeech --model deepspeech-0.5.1-models/output_graph.pbmm --alphabet deepspeech-0.5.1-models/alphabet.txt --lm deepspeech-0.5.1-models/lm.binary --trie deepspeech-0.5.1-models/trie --audio jocko/jocko_200_10min.wav >> 10min.txt
