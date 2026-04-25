FROM nginx:alpine as builder
WORKDIR /app
COPY *.html /usr/share/nginx/html
EXPOSE 80