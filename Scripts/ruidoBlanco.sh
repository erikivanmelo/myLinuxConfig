fileName=ruidoBlanco.mp3
socket=/tmp/mpv_socket_ruidoBlanco
case $1 in

    'toggle')
        echo socket: $socket
        if [[ -S "$socket" ]]; then
            echo "el socket ya existe"
        else
            mpv --no-terminal "--input-ipc-server=$socket" "$fileName" &
            echo se ejecuta
            exit
        fi

        output=$(echo '{ "command": ["get_property", "pause"] }' | socat - "$socket")
        echo output: $output
        [[ $output == *"true"* ]] && pause="false" || pause="true"
        echo pause: $pause
        echo "{ \"command\": [\"set_property\", \"pause\", $pause] }" | socat - "$socket"
    ;;

    'volumeUp')
        echo "{ \"command\": [\"add\", \"volume\", $2] }" | socat - "$socket"
    ;;
    'volumeDown')
        echo "{ \"command\": [\"add\", \"volume\", -$2] }" | socat - "$socket"
    ;;
    *) exit
esac

