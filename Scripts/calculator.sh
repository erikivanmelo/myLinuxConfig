#!/bin/bash
calculation=$1

notify-send "Calculator" "`echo $calculation | bc`"

exit