FROM alpine:latest
LABEL maintainer="robert@splat.cx" description="basic sickrage container" 

# set version label
#ARG BUILD_DATE
#LABEL build_version="pouncy.house. Build-date: ${BUILD_DATE}"

RUN \
	apk add --no-cache \
	    ca-certificates \
	    python2 \
	    wget && \

# basic
	mkdir -p /config && \

# add user
	addgroup -g 1000 sickrage && \
	adduser -H -D -G sickrage -s /bin/false -u 1000 sickrage && \

# install sickrage
	wget -q -O /tmp/sickrage.tgz https://codeload.github.com/SickRage/SickRage/legacy.tar.gz/master && \
	tar zxf /tmp/sickrage.tgz -C / && \
	mv /SickRage* /app && \

# permissions
	chown -R sickrage:sickrage /app /config && \

# cleanup
	rm -rf /tmp/*

COPY apprun.sh /app/apprun.sh

# volume mappings
VOLUME /config
EXPOSE 8081

USER sickrage
ENTRYPOINT ["/app/apprun.sh"]
