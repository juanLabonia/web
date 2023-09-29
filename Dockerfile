# BASE
FROM alpine

# Directorio de trabajo
WORKDIR /usr/share/nginx/html

# APK
RUN apk update && apk add --no-cache git nginx

# Crea un directorio temporal
RUN mkdir /tmp/temp_repo

# Clona el repositorio en el directorio temporal (reemplaza URL_DEL_REPOSITORIO con la URL de tu repositorio)
RUN git clone https://github.com/juanLabonia/web.git /tmp/temp_repo

# Copia el contenido del directorio temporal al directorio de trabajo del contenedor
RUN cp -r /tmp/temp_repo/virtualHost/101si/. .

# Configuracion de nginx
COPY /tmp/www/default.conf /etc/nginx/http.d/default.conf

# Se exponen los puertos 80 / 443
EXPOSE 80
EXPOSE 443

# RUN COMMAND
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]
