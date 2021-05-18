FROM ubuntu:16.04

RUN apt-get -y upgrade
RUN apt-get -y update

RUN apt-get -yq install git-core curl unzip apt-transport-https
RUN apt-get -y install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libexpat1 libfontconfig1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get -y install nodejs

RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN echo 'export PATH="$HOME/.yarn/bin:$PATH"' >> /etc/profile.d/yarn.sh

RUN npm install -g http-server mocha sinon chai mongoose cheerio

RUN curl https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/526987/chrome-linux.zip --output /tmp/chromium-browser.zip && unzip /tmp/chromium-browser.zip -d /root
RUN PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm install -g puppeteer@1.6.1

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get -y update
RUN apt-get -y install mongodb-org-shell
