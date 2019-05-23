#!/bin/sh

while true
do
	ps -A | grep node > /dev/null
	if [ $? = "1" ]
		then setsid script -a -f log -c 'node bot.js' >/dev/null 2>&1 < /dev/null &
	fi
	sleep 384000
done