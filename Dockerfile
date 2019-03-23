FROM mhart/alpine-node:10

WORKDIR /app

COPY package*.json ./

RUN apk add --no-cache --virtual .build-deps make gcc g++ python && \
    npm install --prod && \
    apk del .build-deps

COPY . .

EXPOSE 5000
CMD ["npm", "start"]
