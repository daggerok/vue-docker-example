FROM node:10.13.0-alpine as builder
LABEL MAINTAINER='Maksim Kostromin https://github.com/daggerok'
WORKDIR /src/app
COPY ./package.json package-lock.json ./
RUN npm i && npm cache clean --force
COPY . .
RUN npm run build

FROM nginx:1.15.5-alpine
LABEL MAINTAINER='Maksim Kostromin https://github.com/daggerok'
HEALTHCHECK --timeout=1s --retries=99 \
        CMD wget -q --spider http://127.0.0.1:80/ \
         || exit 1
RUN apk add --update --upgrade --no-cache python2
ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /src/app/dist /usr/share/nginx/html
