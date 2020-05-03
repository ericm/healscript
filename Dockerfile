ARG arch=x86_64
FROM multiarch/alpine:${arch}-v3.8

RUN apk add --no-cache curl jq docker

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
