#!/bin/bash
theEndBase=false;

#The lists folder
base="$HOME/Documents/Notes/checklists"

if [ ! -d $base ]; then
	mkdir $base
fi

while [[ $theEndBase == false ]]; do
	file="`ls $base | dmenu -i -l 100 `"
	contentBase=`ls $base`

	#if you didn't select eny list the script closes
	if [ -z $file ]; then
		theEndBase=true;
		echo "`basename -- "$0"` closed."

	#if the list name ends with "--remove" the list is removed
	elif [[ $file == *"--remove" ]]; then
		rm "$base/${file: 0:-9}"
		echo "File \"${file: 0:-9}\" removed."

	
	elif [[ $file == *" --rename "* ]]; then

		IFS=' --rename ' read -a rn <<< "$file"	

		echo dice ${rn[0]}

		echo y ${rn[1]}
		if [[ ${rn[1]} != *".txt" ]]; then
			mv "$base/${rn[0]}" "$base/${rn[1]}.txt"
		else
			mv "$base/${rn[0]}" "$base/${rn[1]}"
		fi

		echo "File \"$base/${rn[0]}\" renamed to \"$base/${rn[1]}\"."
		#file="${item: 3}"
		#${time[0]}

	#if the entered list name exists, the list is opened
	elif [[ $contentBase =~ $file ]]; then
		echo "File \"$file\" opened."
		theEndFile=false;
		while [[ $theEndFile == false ]]; do
			item="`cat "$base/$file" | dmenu -i -l 100 `"

			#if you didn't select any item, it returns to the principal list
			if [ -z "$item" ]; then
				theEndFile=true;
				echo "File \"$file\" closed."
			
			elif grep -q "$item" "$base/$file"; then
				sed -i "/$item/d" "$base/$file"
				echo "Item \"$item\" removed."
			
			else

				if [[ "${item: -1}" != '.' ]]; then
					item="$item."
				fi
				echo $item  >> "$base/$file"
				echo "Item \"$item\" added."
			fi
		done

	#if the name of the entered list doesn't exist, the list is created
	else
		if [[ $file != *".txt" ]]; then
			file="$file.txt"
		fi

		echo "File \"'$file'\" added."
		touch "$base/$file"
	fi

done
