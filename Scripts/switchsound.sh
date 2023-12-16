#!/bin/bash

# Obtener el estado actual de las salidas de audio
current_sink=$(pactl info | grep "Default Sink" | awk '{print $3}')

# Definir los nombres de las salidas de audio entre las que quieres cambiar
output1="bluez_sink.20_20_12_30_30_EE.a2dp_sink"
output2="alsa_output.pci-0000_00_1b.0.analog-stereo"

# Función para cambiar la salida de audio
toggle_audio_output() {
    if [ "$current_sink" == "$output1" ]; then
        new_sink="$output2"
    else
        new_sink="$output1"
    fi

    pactl set-default-sink "$new_sink"
    pactl list short sink-inputs | while read stream; do
        stream_id=$(echo "$stream" | awk '{print $1}')
        pactl move-sink-input "$stream_id" "$new_sink"
    done

    echo "Cambiado a la salida de audio: $new_sink"
}

# Llamar a la función para cambiar la salida de audio
toggle_audio_output
