FROM node:18-alpine

RUN deluser node && \
    mkdir /opt/foundryvtt && \
    adduser --disabled-password fvtt -u 1000 && \
    chown -R fvtt:fvtt /opt/foundryvtt && \
    chmod -R g+s /opt/foundryvtt 

WORKDIR /opt/foundryvtt
COPY run-server.sh /usr/local/bin/run-server.sh
RUN chmod +x /usr/local/bin/run-server.sh

USER fvtt

VOLUME /mnt/data
VOLUME /mnt/host

EXPOSE 30000

ENTRYPOINT ["/usr/local/bin/run-server.sh"]
