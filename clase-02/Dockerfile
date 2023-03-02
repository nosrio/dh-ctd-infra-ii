FROM bash:latest

RUN apk add --update --no-cache netcat-openbsd

COPY server.sh /

EXPOSE 3000

ENTRYPOINT [ "bash", "/server.sh" ]
