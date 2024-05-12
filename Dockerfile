FROM node:14-slim AS build

WORKDIR /usr/src/app


COPY package*.json ./


RUN npm install --production


COPY . .


FROM node:14-slim

WORKDIR /usr/src/app


COPY --from=build /usr/src/app .

EXPOSE 5000

CMD ["node", "index.js"]
