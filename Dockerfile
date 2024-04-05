FROM node:18-slim

RUN apt-get update -y && apt-get install -y openssl

WORKDIR /app

COPY package.json .
COPY pnpm-lock.yaml .

RUN npm install -g pnpm

RUN pnpm install 

COPY . .

EXPOSE 8080

CMD [ "pnpm", "dev" ]






