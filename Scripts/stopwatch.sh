#!/bin/bash

now=$(date +%s)sec

if [ -z $1 ]; then
	message="▶ `cat /dev/null | dmenu -p name`"
elif [[ $1 == "-s" ]]; then
	echo "" > .stopwatch
	echo "" > .stopwatch.seconds
	killall stopwatch.sh
elif [[ $1 == "-p" ]]; then
	if [[ ! -z `cat .stopwatch` ]]; then
		temp="`cat .stopwatch`" 

		if [[ ${temp:0:1} == "▶" ]]; then

			echo "`echo "$temp" | tr ▶ ⏸`" > .stopwatch
			killall stopwatch.sh
		else
			message="`echo "${temp%%:*}" | tr ⏸ ▶`"
			lastsecond="`cat .stopwatch.seconds`"
			actualsecond=$(date +%s)sec;
			now=`echo "$(date +%s)-$lastsecond" | bc`sec
		fi
	else
		exit
	fi
else
	message="▶ $1"
fi


while true; do
	printf "%s: %s" "$message" $(TZ=UTC date --date now-$now +%H:%M:%S) | tee .stopwatch
	printf "%s" $(TZ=UTC date --date now-$now +%s) | tee .stopwatch.seconds
	sleep 1;
	
	#the cursor moves to the beginning of the line
	printf "\033[100D";
done