# etapa de compilación
FROM node:lts-alpine as build-stage

# install simple http server for serving static content
RUN npm install -g http-server
WORKDIR /frontenddos
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# etapa de producción
FROM nginx:1.13.12-alpine as production-stage
COPY --from=build-stage /frontenddos/dist /usr/share/nginx/html
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY frontend-nginx.conf /etc/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]



