FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add perl perl-app-cpanminus perl-net-ssleay curl wget make nginx

## build tides app dependencies
RUN cpanm Carton
RUN mkdir -p /app/src/tides/

WORKDIR /app/src/tides/
COPY ./app/src/tides/cpanfile* /app/src/tides/
RUN carton install

## COPY everything else
WORKDIR /app
COPY ./app /app/

EXPOSE 80

CMD /app/bin/start.sh
