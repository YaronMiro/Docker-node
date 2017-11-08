FROM node:6-alpine
MAINTAINER Yaron Miro <yaron.miro@gmail.com>

# The Node app root path.
ENV APP_ROOT_PATH /usr/src/app

RUN apk add --update tini

RUN mkdir -p $APP_ROOT_PATH

WORKDIR $APP_ROOT_PATH

# Copy & install the app node modules dependencies.
COPY package.json package.json

RUN npm install && npm cache clean --force

# Copy the App files.
COPY . .

EXPOSE 3000

CMD ["/usr/bin/tini", "--", "node", "./bin/www"]
