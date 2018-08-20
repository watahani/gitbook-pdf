FROM node:6-slim

ARG VERSION=3.2.3

LABEL version=$VERSION
LABEL maintainer="haniyama_wataru@sgk.jp"

RUN mkdir -p /usr/share/man/man1 && \
    (echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list) && \
    apt-get update -y && \
    apt-get install -t jessie-backports openjdk-8-jdk -y &&\
    apt-get install -y python\
    python-dev python-pip python-virtualenv libgl1-mesa-glx libxcomposite1\
    git calibre graphviz && \
    apt-get autoremove -y &&\
    npm install --global gitbook-cli gitbook-pdfgen svgexport &&\
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# install fonts
RUN apt-get update -y &&\
    apt-get install -y fonts-ipafont fonts-ipaexfont fonts-noto fonts-noto-cjk &&\
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# for windows environment
RUN npm config set bin-links false

RUN    gitbook fetch ${VERSION}

EXPOSE 4000

RUN mkdir /book
WORKDIR /book

CMD ["gitbook","--help"]