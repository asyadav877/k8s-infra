FROM node:14-alpine

ARG PORT

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE $PORT

CMD [ "node", "tasks-app.js" ]