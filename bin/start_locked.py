#!/usr/bin/python

import socket
import subprocess
import time
import sys
s = socket.socket()
try:
    s.bind(("localhost", 65341))
except socket.error:
    print("Locked and not starting.")
else:
    print("locked")
    command = sys.argv[1:]
    print("running {}".format(" ".join(command)))
    subprocess.check_call(command)
    while 1:
        time.sleep(1000)

