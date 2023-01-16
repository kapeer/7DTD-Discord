FROM node:16-alpine

WORKDIR /bot
RUN apk add --update curl

RUN curl -L https://github.com/LakeYS/Dishorde/releases/download/v2.2.1/Dishorde.tar.gz > 7dtdbot.tar.gz
RUN tar -xzf 7dtdbot.tar.gz && \
        rm 7dtdbot.tar.gz
RUN cd Dishorde && \
        chmod +x run.sh && \
        npm install

WORKDIR /bot/Dishorde
CMD ["/bot/Dishorde/run.sh"]
