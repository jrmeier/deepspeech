# takes the podcast file and transcribes it

name=$1

input="./wav/$1_full.wav"
raw_output="./output/$1_raw.txt"


# echo "input: $input output: $output"

deepspeech --model deepspeech-0.5.1-models/output_graph.pbmm --alphabet deepspeech-0.5.1-models/alphabet.txt --lm deepspeech-0.5.1-models/lm.binary --trie deepspeech-0.5.1-models/trie --audio $input > $raw_output

# python formatter.py $raw_output


rm $input
# rm $raw_output
