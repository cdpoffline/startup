#!/bin/bash

cd "`dirname \"$0\"`"

source config.sh

echo "adding startup to upstart"

sudo tee "$upstart_config_file" <<EOF
description "start the offline material services"
author      "CoderDojo offline materials"

start on started mountall
stop on shutdown

respawn 
respawn limit 99 5

script
    export HOME="/root"
    exec "$start_all_modules_sh" 1>>"$start_all_modules_sh_log" 2>>"$start_all_modules_sh_log"
end script
EOF

echo "adding startup to rc.local"

escaped_rc_local_line="`echo \"$rc_local_line\" | sed -e 's/[\\/\\\\\\&]/\\\\&/g'`"
echo "command: \"$rc_local_line\""
echo "escaped line in /etc/rc.local: \"$escaped_rc_local_line\""
sudo sed -i "s/^exit 0/$escaped_rc_local_line\nexit 0/g" /etc/rc.local
sudo bash -c "echo \"$rc_local_line\" >> /etc/rc.local"
