#!/bin/bash

while : 
do
	#curl wttr.in/?format=%m+%c%p+%t | tee $HOME/.weather
	weather="`curl wttr.in/?format=%m+%c+%t`"
	if [[ weather != "" ]]; then
		echo $weather > $HOME/.weather
	fi
	sleep 10m
done