FROM node:16-alpine

WORKDIR /bot
ADD package.json .
RUN apk add --update curl jq
RUN VERSION=`jq -r .version package.json`; curl -L https://github.com/LakeYS/Dishorde/releases/download/v${version}/Dishorde.tar.gz | tar -xzf -
RUN cd Dishorde && \
        chmod +x run.sh && \
        npm install

WORKDIR /bot/Dishorde
CMD ["/bot/Dishorde/run.sh"]
