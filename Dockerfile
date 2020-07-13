
FROM node:alpine as construir

WORKDIR /usr/app

COPY package.json . 

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=construir /usr/app/build /usr/share/nginx/html



