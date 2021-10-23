FROM alpine:3

## Update OS and install dependencies
RUN apk upgrade --no-cache && \
    apk add --no-cache perl~=5.32   perl-dev~=5.32    perl-app-cpanminus~=1 \
                       nginx~=1.20  curl=~7           wget~=1 \
                       make~=4.3    gcc~=10.3         libc-dev~=0.7 \
                       openssl~=1.1 libressl-dev~=3.3 zlib~=1 \
                       zlib-dev~=1  tzdata~=2021

## Install perl dependencies
RUN cpanm install Carton

## build 0hy.es dependencies
RUN mkdir -p /app/src/0hy.es

WORKDIR /app/src/0hy.es
COPY /app/src/0hy.es/cpanfile* /app/src/0hy.es/
RUN carton install

## COPY everything else
WORKDIR /app
COPY ./app /app/


WORKDIR /app/src/0hy.es
EXPOSE 80

CMD ["carton", "run", "/app/src/0hy.es/script/ohyes", "prefork", "--listen", "http://*:80", "--mode", "production", "--workers", "2"]
