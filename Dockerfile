FROM node:latest AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:latest

COPY --from=build /app/dist/fin-project /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
