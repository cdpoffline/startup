#!/bin/bash

cd "`dirname \"$0\"`"

if [ "$1" != "locked" ]
then
  echo "locking"
  python start_locked.py "$0" "locked" "$@" &
  exit 0
fi

start_line="---------------------- `date` ----------------------"

echo "$start_line"
echo "running locked"

cd "`dirname \"$0\"`"
shift 
source config.sh
cd ../../../active-modules
echo "modules directory: \"`pwd`\""

for module_name in `ls`
do
  startup_file="$module_name/bin/startup.sh"
  if [ -f "$startup_file" ]
  then
    echo -n "starting $module_name ..."
    log_file="$logs_folder/$module_name.log"
    echo "$start_line" >> $log_file
    if "$startup_file" "$@" 1>>"$log_file" 2>>"$log_file" 
    then
      echo "ok, output in \"$log_file\""
    else
      echo "fail, look into \"$log_file\""
    fi
  else 
    echo "  [skipped $module_name, no startup.sh]"
  fi
done

chown -R "$1" $logs_folder/*

exit 0

