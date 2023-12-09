#!/bin/sh

#Get command
case $1 in
    'play-pause')
        cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause';;
    'next')
        cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next';;
    'previous')
        cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous';;
    'stop')
        cmd='/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop';;
    *) exit
esac

players=`qdbus | grep -E -i 'org.mpris.MediaPlayer2'`
#Send command to qdbus
while IFS= read -r line; do
  if [[ `qdbus $line /org/mpris/MediaPilayer2` -eq "" ]]; then
		`echo "dbus-send --print-reply --dest="${line/ /} $cmd`
		break
	fi
done <<< "$players"


unset cmd
