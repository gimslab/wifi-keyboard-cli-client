import sys

import readchar
import requests

map = {
    readchar.key.ENTER: 13,
    readchar.key.BACKSPACE: 8,
    readchar.key.UP: 38,
    readchar.key.DOWN: 40,
    readchar.key.LEFT: 37,
    readchar.key.RIGHT: 39,
    readchar.key.HOME: 36,
    readchar.key.END: 35,
    readchar.key.ESC: 27,
    readchar.key.INSERT: 45,
    readchar.key.PAGE_UP: 33,
    readchar.key.PAGE_DOWN: 34,
    readchar.key.SUPR: 46,  # Delete
    "\t": 9,  # Tab
}


def sendKey(seq, ch, prefix, keyCode):
    url = "http://192.168.50.220:7777/key?%s,%s%s," % (seq, prefix, keyCode)
    requests.get(url=url, params={})


if len(sys.argv) < 2:
    print("need initial seq")
    exit()

seq = int(sys.argv[1])
while True:
    seq += 1
    ch = readchar.readkey()
    if ch == readchar.key.CTRL_C:
        print("\nlast seq is %s" % seq)
        break
    specialKeyCode = map.get(ch)
    if (specialKeyCode):
        sendKey(seq, ch, 'D', specialKeyCode)
    else:
        keyCode = ord(ch)
        sendKey(seq, ch, 'C', keyCode)
