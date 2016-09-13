FROM 1and1internet/ubuntu-16-nginx-passenger
MAINTAINER brian.wilkinson@1and1.co.uk
ARG DEBIAN_FRONTEND=noninteractive
ENV GEM_HOME /var/www/._gems
ENV PATH ${PATH}:${GEM_HOME}/bin
COPY files /
RUN \
	mkdir -p $GEM_HOME && \
	apt-get update -q && \
	apt-get install -y curl gnupg build-essential ruby2.3-dev libsqlite3-dev nodejs && \
	ln -sf /usr/bin/nodejs /usr/local/bin/node && \
	sed -i 's|passenger_app_type wsgi|passenger_ruby /usr/bin/ruby2.3|' /etc/nginx/sites-enabled/default && \
	/usr/bin/passenger-config validate-install  --auto --no-colors
