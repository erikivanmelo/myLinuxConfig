exec scrot ~/Pictures/Screenshots/scrot_%F.png && xclip -selection clipboard -t image/png -i `ls -t ~/Pictures/Screenshots/* | head -n1`
