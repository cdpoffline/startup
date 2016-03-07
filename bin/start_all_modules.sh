#!/bin/bash

if [ "$1" != "locked" ]
then
  echo "locking"

  python "$0" <<'EOF'
import socket
import subprocess
import time
import sys
s = socket.socket()
s.bind(("localhost", 65341))
exit(subprocess.call([sys.argv[1], "locked"])
while 1:
    time.sleep(1000)
EOF
  exit $?
fi

echo "running locked"

cd "`dirname \"$0\"`"
cd ../../
echo "modules directory: \"`pwd`\""

for module_name in `ls`
  startup_file="$module_name/bin/startup.sh"
  if [ -f "$startup_file" ]
  then
    echo "starting $module_name"
    "$startup_file"
  else 
    echo "skipping $module_name"
  fi
done


