# takes the podcast file and transcribes it

name=$1

input="./wav/$1.wav"
output="./output/$1.txt"


# echo "input: $input output: $output"

deepspeech --model deepspeech-0.5.1-models/output_graph.pbmm --alphabet deepspeech-0.5.1-models/alphabet.txt --lm deepspeech-0.5.1-models/lm.binary --trie deepspeech-0.5.1-models/trie --audio $input > $output

rm $input
