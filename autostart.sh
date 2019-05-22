#!/bin/sh

while true
do
	ps -A | grep node > /dev/null
	if [ $? = "1" ]
		then script -a -f log -c 'node bot.js' &
	fi 
	sleep 384000
done

