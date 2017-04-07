FROM ubuntu:trusty
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get -y update
RUN apt-get install -y -q software-properties-common wget
RUN add-apt-repository -y ppa:mozillateam/firefox-next

RUN wget -qO- https://deb.nodesource.com/setup_6.x | sudo bash -
RUN sudo apt-get install -y nodejs

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN apt-get update -y
RUN apt-get install -y -q \
  firefox:i386 \
  google-chrome-beta \
  openjdk-8-jre-headless \
  nodejs \
  x11vnc \
  xvfb \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic
RUN useradd -d /home/seleuser -m seleuser
RUN mkdir -p /home/seleuser/chrome
RUN chown -R seleuser /home/seleuser
RUN chgrp -R seleuser /home/seleuser

ADD ./scripts/ /home/root/scripts
RUN npm install -g \
  selenium-standalone@latest \
  phantomjs-prebuilt && \
  selenium-standalone install
EXPOSE 4444 5999
ENTRYPOINT ["sh", "/home/root/scripts/start.sh"]
