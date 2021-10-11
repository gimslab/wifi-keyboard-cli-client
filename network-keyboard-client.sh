#addr='http://192.168.50.220:7777/key?'
addr='http://192.168.50.220:5555/key_event'


settings=$(stty -g)
stty -echo
#stty stop undef    # or 'stty raw' to read other control chars
stty raw
IFS=

while ( true ); do
  read -r -n1 ch
  echo read=[$ch]
  keycode=$(printf "%d" \'$ch\')
  keycodeHex=$(printf "%x" \'$ch\')
  echo keycode=[$keycode] [$keycodeHex]
  databody=$keycode
  
  [[ $keycode = 127 ]] && databody=-5 # BS
  [[ $keycode = 39 ]] && databody=10 # Enter
  
  echo databobdy=[$databody]

  curl $addr --data-raw $databody

done


stty "$settings"

