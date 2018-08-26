#!/bin/bash

declare -a SERVICE=("opendj" "wildfly")

for i in "${SERVICE[@]}"
do
	if ps ax | grep -v grep | grep -v grep | grep $i > /dev/null
	then
    		echo "$i service already running"
	else
		nohup $HOME/scripts/$i.sh > /dev/null 2>&1 &
		echo Starting $i
		sleep 1
		if ps ax | grep -v grep | grep -v grep | grep $i > /dev/null
		then
			echo $i service started
		fi
	fi
done	
