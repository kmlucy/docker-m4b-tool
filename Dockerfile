FROM php:7.3-cli-stretch
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

#Update stretch repositories
RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list
RUN sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN sed -i 's/main/main contrib non-free/' /etc/apt/sources.list && apt-get update && apt-get install -y ffmpeg mp4v2-utils fdkaac && \
	cd /usr/local/bin && \
	curl --silent "https://api.github.com/repos/sandreas/m4b-tool/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | xargs -I {} curl -sOL "https://github.com/sandreas/m4b-tool/releases/download/"{}"/m4b-tool.phar" && \
	mkdir /data && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /data
ENTRYPOINT [ "php", "/usr/local/bin/m4b-tool.phar" ]
CMD [ "--help" ]
