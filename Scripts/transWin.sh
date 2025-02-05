#!/bin/bash

# Obtener la ventana activa
WIN_ID=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $5}')

# Aplicar transparencia a la ventana activa usando transset
transset-df -t --id $WIN_ID 0.65
