# Based on this guide https://mherman.org/blog/dockerizing-a-react-app/

# pull official base image
FROM node:15.0.1-alpine3.10

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm install react-scripts@4.0.0 -g

# add app
COPY . ./

# start app
EXPOSE 3000
CMD ["npm", "start"]