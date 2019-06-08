#!/bin/sh

while true
do
	ps -A | grep node > /dev/null
	if [ $? = "1" ]
	then
		echo 'started'
		setsid script -a -f log -c 'node bot.js' >/dev/null 2>&1 < /dev/null &
		
	else
		 echo 'node in running'
	fi
	echo 'Boot is running'
	sleep 384
done