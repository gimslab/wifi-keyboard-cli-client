#!/bin/bash

# exam
# curl 'http://192.168.50.220:7777/key?215,C97,' \
# C: character, D: down, U: up

function findStartSeq {
  curl -s $addr | grep seqConfirmed | head -1 | sed 's/[^0-9]//g'
}

function sendKey {
  seq=$1
  keyCodeParam=$2
  curl -s ${addr}/key?${seq},$keyCodeParam,
}

addr='http://192.168.50.220:7777'

mode=$1 # -d debug, -s silent
debugMode=$( [[ "$mode" = "-d" ]] && echo true || echo false)
silentMode=$( [[ "$mode" = "-s" ]] && echo true || echo false)
echo addr: $addr
echo debugMode: $debugMode
echo silentMode: $silentMode
seq=$(findStartSeq)

settings=$(stty -g)
[[ $silentMode = true ]] && stty -echo
stty raw
IFS=

while ( true ); do
  read -r -n1 ch
  [[ $debugMode = true ]] && printf "read:%s\r\n" $ch
  keycode=$(printf "%d" \'$ch\')
  [[ $debugMode = true ]] && printf "keycode: %s\r\n" $keycode
  keyCodeParam=C$keycode
  
  [[ $keycode = 127 ]] && keyCodeParam=D8 # BS
  [[ $keycode = 39 ]] && keyCodeParam=D13 # Enter
  [[ $keycode = 13 ]] && keyCodeParam=D13 # Enter

  seq=$(( seq + 1 ))

  response=$(sendKey $seq $keyCodeParam)
  [[ $debugMode = true ]] && printf "response: %s" $response
done

stty "$settings"

