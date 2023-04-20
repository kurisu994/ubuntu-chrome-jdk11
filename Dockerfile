FROM ubuntu:20.04
LABEL author="kurisu"
LABEL maintainer="makise_kurisuu@outlook.jp"

RUN apt-get update
# Install chrome dependencies
RUN apt-get -y install gnupg2 openjdk-11-jdk zip unzip
RUN apt-get -y install xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable
RUN apt-get -y install wget fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0
RUN apt-get -y install xvfb gtk2-engines-pixbuf libatspi2.0-0 libcurl3-gnutls libcurl3-nss
RUN apt-get -y install imagemagick x11-apps libcurl4 libgbm1 libgtk-3-0 libnspr4 libu2f-udev
RUN apt-get -y install libnss3 libxcomposite1 libxdamage1 libxkbcommon0 libxrandr2 xdg-utils
RUN Xvfb -ac :99 -screen 0 1280x1024x16 & export DISPLAY=:99
# Install chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
RUN apt-get -f install
RUN rm -f google-chrome*.deb
# Install chromedriver
RUN wget https://chromedriver.storage.googleapis.com/112.0.5615.49/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod +x chromedriver
RUN mkdir -p /driver
RUN mv chromedriver /driver/
RUN rm -f chromedriver_linux64.zip
