#!/bin/bash
text="`cat /dev/null | dmenu -p Translate`"
if [[ -z text ]]; then
	exit
fi

if [[ `trans -b -identify $text` == "en" ]]; then
	lenguage="en:es"
else
	lenguage="es:en"
fi

traduction="`trans -b $lenguage \"$text\"`"

if [[ $traduction == "" ]]; then
	notify-send "Translate" "I can't"	
elif [[ $traduction == $text ]]; then
	notify-send "Translate" "IDK"
else
	notify-send "Translate" "$text = $traduction"
fi

exit