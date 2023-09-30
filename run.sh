#!/bin/sh
# 1.0 Verificar si el directorio temporal existe y eliminarlo si es necesario
if [ -d "/tmp/www" ]; then
  echo "Eliminando directorio temporal..."
  export PATH='/tmp/www:/usr/bin'
  rm -rf /tmp/www
fi

# 1.1 Crear un directorio de trabajo
mkdir /tmp/www
cd /tmp/www

# 2. Clonar un repositorio de Git (reemplaza URL_DEL_REPOSITORIO)
git clone https://github.com/juanLabonia/web.git

# 3. Ejecutar el comando "certbot renew"
certbot renew

# 4. copio los archivos SSL
cp /etc/letsencrypt/live/www.101si.com.ar/cert.pem /ssl/www.101si.com.ar/. -p
cp /etc/letsencrypt/live/www.101si.com.ar/privkey.pem /ssl/www.101si.com.ar/. -p

# 5. Elimino y construyo la imagen Docker (asegúrate de que la imagen exista)
# Verificar si la imagen existe y eliminarla si es necesario
if sudo docker images -q www:2 &>/dev/null; then
  echo "Eliminando la imagen existente: www:2"
  sudo docker rmi www:2 -f
fi

docker build -t www:2 - < /tmp/www/web/Dockerfile

# 6. Verificar si existe un contenedor con la imagen "www:2" y detenerlo si es necesario
if sudo docker ps -a --filter "name=www" --filter "ancestor=www:2" --format '{{.Names}}' | grep -q "www"; then
  echo "Deteniendo el contenedor existente..."
  sudo docker stop www
fi

# 7. Ejecutar el contenedor Docker con los puertos 80 y 443 mapeados
docker run -d -v /ssl/www.101si.com.ar/:/ssl:ro --name www --rm -p 80:80 -p 443:443 www:2
