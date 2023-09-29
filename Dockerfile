# Se utiliza la imagen base de Nginx Slim
FROM nginx:alpine

# Directorio de trabajo en el contenedor
WORKDIR /usr/share/nginx/html

# Instalamos git en el contenedor
RUN apk update && apk add --no-cache git

# Creamos un directorio temporal
RUN mkdir /tmp/temp_repo

# Clonamos el repositorio en el directorio temporal 
RUN git clone https://github.com/juanLabonia/web.git /tmp/temp_repo

# Copiamos el contenido del directorio temporal al directorio de trabajo del contenedor
RUN cp -r /tmp/temp_repo/virtualHost/101si/. .

# Eliminamos el directorio temporal (opcional, pero recomendado)
RUN rm -rf /tmp/temp_repo

# Exponemos el puerto 80 para servir el sitio web
EXPOSE 80

# Comando para iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
