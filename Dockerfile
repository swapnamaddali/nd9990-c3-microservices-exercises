# Use NodeJS base image
FROM node:13-alpine As builder

# Create app directory
WORKDIR /uda-front/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./
COPY tsconfig.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

RUN npm run prod

FROM nginx:alpine

COPY --from=builder /uda-front/src/app/www/ /usr/share/nginx/html
