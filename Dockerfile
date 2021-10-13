FROM alpine:3

RUN apk upgrade --no-cache
RUN apk add --no-cache perl~=5.32 perl-dev~=5.32 perl-app-cpanminus~=1 nginx~=1.20 curl=~7 wget~=1 make~=4.3 gcc~=10.3 libc-dev~=0.7 openssl~=1.1 libressl-dev~=3.3 zlib~=1 zlib-dev~=1
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

CMD ["/app/bin/start.sh"]
