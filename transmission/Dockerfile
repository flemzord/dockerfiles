FROM alpine:3.5
MAINTAINER Flemzord <https://github.com/flemzord>

LABEL description="transmission based on alpine" \
      tags="latest" \
      build_ver="2016110801"

ENV UID=991 \
    GID=991 \
    WEBROOT=""

RUN apk add -U transmission-daemon \
                su-exec \
                s6 \
    && rm /var/cache/apk/*

VOLUME ["/data","/home/transmission/.config/transmission-daemon/"]
COPY rootfs /
RUN chmod +x /usr/local/bin/startup /etc/s6.d/*/*

EXPOSE 9091

ENTRYPOINT ["/usr/local/bin/startup"]
CMD ["s6-svscan", "/etc/s6.d"]
