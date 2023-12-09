#!/bin/bash

now=$(date +%s)sec

if [ -z $1 ]; then
	message="▶ `cat /dev/null | dmenu -p name`"
elif [[ $1 == "-s" ]]; then
	echo "" > $HOME/.chronometer
	echo "" > $HOME/.chronometer.seconds
	killall chronometer.sh
elif [[ $1 == "-p" ]]; then
	if [[ ! -z `cat $HOME/.chronometer` ]]; then
		temp="`cat $HOME/.chronometer`" 

		if [[ ${temp:0:1} == "▶" ]]; then

			echo "`echo "$temp" | tr ▶ ⏸`" > $HOME/.chronometer
			killall chronometer.sh
		else
			message="`echo "${temp%%:*}" | tr ⏸ ▶`"
			lastsecond="`cat $HOME/.chronometer.seconds`"
			now=`echo "$(date +%s)-$lastsecond" | bc`sec
		fi
	else
		exit
	fi
else
	message="▶ $1"
fi



while true; do
	printf "%s: %s" "$message" $(TZ=UTC date --date now-$now +%H:%M:%S) | tee $HOME/.chronometer
	printf "%s" $(TZ=UTC date --date now-$now +%s) | tee $HOME/.chronometer.seconds
	sleep 0.1s;
	printf "\033[100D";
done

