# Use NodeJS base image
FROM node:13

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

RUN npm run build

# Bind the port that the image will run on
EXPOSE 4200

# Define the Docker image's behavior at runtime
CMD ["npm", "run", "start"]
