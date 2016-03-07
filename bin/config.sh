#!/bin/bash

upstart_config_file=/etc/init/offline-server-startup.conf
rc_local_line_idetifier="run offline materials on startup"

cwd="`pwd`"
cwd="`realpath \"$cwd\"`"
start_all_modules_sh="`realpath \"$cwd\"`/start_all_modules.sh"
logs_folder="`realpath \"$cwd/../web/logs\"`"
mkdir -p "$logs_folder"
start_all_modules_sh_log="$logs_folder/startup.log"

startup_command="\"$start_all_modules_sh\" 1>>\"$start_all_modules_sh_log\" 2>>\"$start_all_modules_sh_log\" # $rc_local_line_idetifier"




