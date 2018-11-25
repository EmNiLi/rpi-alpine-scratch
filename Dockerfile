FROM hypriot/rpi-alpine-scratch

ARG ID=1000
ARG LANG=de_DE.UTF-8
ARG TZ=Europe/Berlin

ENV LANG=$LANG

RUN addgroup -g $ID app && \
    adduser -u $ID -G app -s /bin/sh -D app && \
    mkdir \
	/app \
	/data \
	/var/log/app &&  \
    apk update && \
    apk upgrade && \
    apk add \
	bash \
	su-exec \
#	tini \
	tzdata && \
    rm -rf /var/cache/apk/*

COPY app-entry.sh /usr/local/bin/app-entry

ENTRYPOINT ["sh", "/usr/local/bin/app-entry"]

CMD ["/bin/bash"]
