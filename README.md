# startup

This module starts other modules when the computer boots. It uses upstart and /etc/rc.local. 
Activated modules that should be statred on boot have a `bin/startup.sh` file. This file is executed as root and gets the user as the first argument.
