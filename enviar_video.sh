#!/bin/bash

#Envía el último vídeo que realizó motion a nuestro Telegram.

archivo=$(ls -ltrp /home/pi/scripts/camara_seguridad/fotos_y_videos/*.mkv | tail -1| sed "s/  */#/g"|cut -f9 -d#)

TOKEN="1111111111:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
ID="111111111"
URL="https://api.telegram.org/bot$TOKEN/sendDocument"
RUTA="$archivo"

curl -X  POST $URL -F chat_id=$ID -F document="@$RUTA"

#Elimina todas las imagenes, ya que las imagenes han sido juntadas en un vídeo.
find /home/pi/scripts/camara_seguridad/fotos_y_videos -name "*.jpg" -type f -print | xargs /bin/rm -f


#Elimina los vídeos que tienen muy poco contenido (Menores a 250k)
find /home/pi/scripts/camara_seguridad/fotos_y_videos -size -250k -name "*.mkv" -exec rm -f {} \;


sudo service motion restart




