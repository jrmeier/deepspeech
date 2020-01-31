echo $2
curl -L $1 --output ./mp3/$2.mp3

./convert.sh $2
./transcribe.sh $2
