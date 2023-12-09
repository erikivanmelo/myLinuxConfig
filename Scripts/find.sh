#!/bin/bash
brave https://www.google.com/search?q=$(echo "" | dmenu -p "Buscar:" | sed 's/ /+/g')

