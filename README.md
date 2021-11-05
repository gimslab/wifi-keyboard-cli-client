# wifi-keyboard-cli-client
This is a cli based client of this android virtual keyboard.
app.https://play.google.com/store/apps/details?id=com.volosyukivan

Features for several control keys and function keys will be added.
e.g. Del, ArrowKey, Esc, Home, End, PgUp, PgDn

Bash version(wifi-keyboard.sh) is stable. Use python script just for testing.
This has been tested on Ubuntu Linux and OSX with latest version of bash now.

Note
If you are using old Bash version like 3.2.x in OSX, Upgrade it to latest version of bash like 5.1.4
On an old version of bash you can get some problem to type multi-byte characters like Korean.

If your default environment is not a bash, run this with proper bash command like
```
/usr/local/bin/bash wifi-keyboard.sh http://192.168.1.220:7777
```

To upgrade bash on your Mac OSX, refer to this https://blog.gimslab.com/entry/Install-bash-again-in-your-Mac-osx-why
