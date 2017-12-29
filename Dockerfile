FROM node:6-slim

ARG VERSION=3.2.3

LABEL version=$VERSION
LABEL maintainer="haniyama_wataru@sgk.jp"

RUN apt-get update && \
    apt-get install -y python python-dev python-pip python-virtualenv libgl1-mesa-glx libxcomposite1 calibre && \
    npm install --global gitbook-cli gitbook-pdfgen svgexport &&\
    gitbook fetch ${VERSION}

EXPOSE 4000

RUN mkdir /book
WORKDIR /book

ENTRYPOINT ["gitbook","--help"]