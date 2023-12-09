#!/bin/bash

if [ -z "$1" ]; then
	message="▶ `cat /dev/null | dmenu -p name`"
else
	if [[ $1 == "-s" ]]; then
		echo "" > .timer
		killall timer.sh
	elif [[ $1 == "-p" ]]; then
		if [[ ! -z `cat .timer` ]]; then
			temp="`cat .timer`" 
			if [[ ${temp:0:1} == "▶" ]]; then

				echo "`echo "$temp" | tr ▶ ⏸`" > .timer
				killall timer.sh
			else
				message="`echo "${temp%%:*}" | tr ⏸ ▶`"
				T=${temp##*: }
			fi
		fi
	else
		message="▶ $1"
	fi
fi

if [ -z "$T" ]; then
	if [ -z "$2" ]; then
		#statements
		T="`cat /dev/null | dmenu -p time`"
	else
		T=$2
	fi
fi

h=0
m=0
s=0
if [[ $T == *':'* ]]; then
	IFS=':' read -a time <<< "$T"

	if [[ ${#time[@]} == 2 ]]; then

	  	m=${time[0]}
	  	s=${time[1]}
	elif [[ ${#time[@]} == 3 ]]; then
	  	h=${time[0]}
	  	m=${time[1]}
	  	s=${time[2]}
	fi
else
	s=$T
fi

#Save the seconds total
((total=$s+($m*60)+($h*3600)))


for (( i = total; i > 0; i-- )); do
	#The time is printed on the screen and in turn the output is redirected to the ".clock" file in the home
	printf "%s: %02i:%02i:%02i" "$message" "$h" "$m" "$s" | tee .timer

	#Wait 1 second
	sleep 1s

	if [[ $s > 0 ]]; then
		((s=$s-1))
	fi

	if [[ $s < 1 && $m > 0 ]]; then
		s='59'
		((m=$m-1 ))
	fi
	
	if [[ $m < 1 && $h > 0 ]]; then
		m='59'
		((h=$h-1))
	fi

	#the cursor moves to the beginning of the line
	printf "\033[100D";
done

#Notification
notify-send `basename -- "$0"` $message

#Alarm sound
paplay complete.oga
echo "" > .timer