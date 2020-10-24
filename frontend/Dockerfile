# Based on this guide https://mherman.org/blog/dockerizing-a-react-app/
# TODO - Create production version of Dockerfile and docker-compose.yml
# pull official base image
FROM node:15.0.1-alpine3.10

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@4.0.0 -g --silent

# add app
COPY . ./

# start app
EXPOSE 3000
CMD ["npm", "start"]