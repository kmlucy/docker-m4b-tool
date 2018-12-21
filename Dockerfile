FROM php:cli
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN apt-get update && apt-get install -y ffmpeg mp4v2-utils && \
	cd /usr/local/bin && \
	curl --silent curl --silent "https://api.github.com/repos/sandreas/m4b-tool/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | xargs -I {} curl -sOL "https://github.com/sandreas/m4b-tool/releases/download/"{}"/m4b-tool.phar" && \
	mkdir /data && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /data
ENTRYPOINT [ "php", "/usr/local/bin/m4b-tool.phar" ]
CMD [ "--help" ]
