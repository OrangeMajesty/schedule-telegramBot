#!/bin/sh

while 1>0 
do
	ps -A | grep node > /dev/null
	if [ $? = "1" ]
		then script -a -f log -c 'node bot.js' &
	fi
	sleep 5
done

