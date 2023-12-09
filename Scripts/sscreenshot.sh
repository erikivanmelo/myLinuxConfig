#selected screen shot
scrot -s ~/Pictures/Screenshots/scrot_%F.png -e 'xclip -selection clipboard -t image/png -i $f'
exit
