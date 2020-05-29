#!/bin/bash

#Envia una alerta cuando Motion detecta movimiento.

TOKEN="1111111111:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
ID="111111111"
MENSAJE="Creo que he visto algo por tu cámara de seguridad!, estoy grabando el movimiento..."
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"
