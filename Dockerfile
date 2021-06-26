# Use NodeJS base image
FROM node:13

# create root application folder
WORKDIR /feed-ms/app

# copy configs to /app folder
COPY package*.json ./

RUN npm install
COPY . .

RUN npm run build

EXPOSE 8080

RUN 

CMD [ "node", "./www/server.js"]