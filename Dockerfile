FROM node:6

ARG VERSION=3.2.3

LABEL version=$VERSION
LABEL maintainer="haniyama_wataru@sgk.jp"

RUN apt-get update && \
    apt-get install -y python python-dev python-pip python-virtualenv libgl1-mesa-glx libxcomposite1 && \
    npm install --global gitbook-cli &&\
    gitbook fetch ${VERSION} && \
	wget --no-check-certificate -nv -O- https://download.calibre-ebook.com/linux-installer.py |python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

CMD /bin/bash