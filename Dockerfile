FROM nginx:1.10.1-alpine
RUN rm /usr/share/nginx/html/*
COPY virtualHost/101si/ /usr/share/nginx/html/ 
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
