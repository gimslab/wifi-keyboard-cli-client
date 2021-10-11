# exam
# curl 'http://192.168.50.220:7777/key?215,C97,' \

startSeq=${1:-10}

addr='http://192.168.50.220:7777/key'

declare -i cnt=startSeq

while ( true ); do
  read str
  for (( i=0; i<${#str}; i++ )); do
    ch=${str:$i:1}
    uc=$(printf %d "'$ch'")
    #hc=$(printf %x "'$ch'")
    #echo [$ch] [$uc] [$hc]
    cnt=$(( cnt + 1 ))
    curl $addr?$cnt,C$uc,
  done
done


