FROM alpine:3.5
MAINTAINER Flemzord <https://github.com/flemzord>

LABEL description="Caddy based on alpine"

RUN apk --no-cache add tini git openssh-client
RUN apk --no-cache add --virtual devs tar curl

RUN curl "https://caddyserver.com/download/build?os=linux&arch=amd64&features=DNS%2Cawslambda%2Ccors%2Cexpires%2Cfilemanager%2Cgit%2Chugo%2Cipfilter%2Cjsonp%2Cjwt%2Clocale%2Cmailout%2Cminify%2Cmultipass%2Cprometheus%2Cratelimit%2Crealip%2Csearch%2Cupload%2Ccloudflare%2Cdigitalocean%2Cdnsimple%2Cdyn%2Cgandi%2Cgooglecloud%2Clinode%2Cnamecheap%2Crfc2136%2Croute53%2Cvultr" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy

RUN rm -fr /var/cache/apk/* \
    apk del devs

EXPOSE 80 443
COPY rootfs /

ENTRYPOINT ["/sbin/tini"]
CMD ["caddy", "--conf", "/etc/Caddyfile"]