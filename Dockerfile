FROM node:6-slim

ARG VERSION=3.2.3

LABEL version=$VERSION
LABEL maintainer="haniyama_wataru@sgk.jp"

RUN apt-get update && \
    apt-get install -y python python-dev python-pip python-virtualenv libgl1-mesa-glx libxcomposite1 calibre && \
    npm install --global gitbook-cli gitbook-pdfgen  &&\
    gitbook fetch ${VERSION}

RUN mkdir /home/node/book
WORKDIR /home/node/book

CMD gitbook install
ENTRYPOINT ["gitbook","pdf"]