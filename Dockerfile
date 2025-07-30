FROM node:16-alpine

WORKDIR /bot
RUN apk add --update curl jq
RUN curl -L $(curl https://api.github.com/repos/LakeYS/Dishorde/releases/latest | jq -r '.assets[].browser_download_url | select(endswith("tar.gz"))') | tar -xzf -
RUN cd Dishorde && \
        chmod +x run.sh && \
        npm install

WORKDIR /bot/Dishorde
CMD ["/bot/Dishorde/run.sh"]
