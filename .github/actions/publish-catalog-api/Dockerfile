FROM alpine:3.15

COPY entrypoint.sh /entrypoint.sh

RUN apk add aws-cli tree

ENTRYPOINT ["/entrypoint.sh"]
