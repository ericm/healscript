ARG arch=x86_64
FROM multiarch/alpine:${arch}-v3.11

RUN apk add --no-cache curl jq docker

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
