#!/bin/bash

cd "`dirname \"$0\"`"

source config.sh

escaped_text="`echo \"$rc_local_line_idetifier\" | sed -e 's/[\\/\\\\\\&]/\\\\&/g'`"
echo "escaped text: \"$escaped_text\""

sudo sed -i "s/^[^\n]*$escaped_text[^\n]*$//g" /etc/rc.local

sudo rm -f "$upstart_config_file"

