##### Prví krok vytvoriť vrstvu kde mám build 
FROM node:16 as node
LABEL author="Gajdy"
WORKDIR /app
COPY package.json package.json

RUN npm install --save --legacy-peer-deps

COPY . .
RUN npm run build 

##### Druhý krok nakopírujem build do defaultne precinga nginx servera
FROM nginx:alpine
VOLUME /var/cache/nginx
COPY --from=node /app/dist /usr/share/nginx/html
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf

#docker build -t nginx-angular -f nginx.dockerfile .
# docker run -p 8080:80 -v $(pwd)/dist:/usr/share/nginx/html nginx-angular