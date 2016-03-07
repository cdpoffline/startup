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
    subprocess.check_call(["/bin/bash", sys.argv[1], "locked"])
    while 1:
        time.sleep(1000)

