FROM alpine:3

RUN apk upgrade --no-cache
RUN apk add --no-cache perl perl-dev perl-app-cpanminus nginx curl wget make gcc libc-dev openssl libressl-dev zlib zlib-dev
RUN cpanm Carton

## build tides app dependencies
RUN mkdir -p /app/src/tides/

WORKDIR /app/src/tides/
COPY ./app/src/tides/cpanfile* /app/src/tides/
RUN carton install

## COPY everything else
WORKDIR /app
COPY ./app /app/

EXPOSE 80

CMD [/app/bin/start.sh]
