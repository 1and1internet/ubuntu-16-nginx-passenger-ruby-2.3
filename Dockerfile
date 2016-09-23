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
<<<<<<< HEAD
	sed -i -e 's|passenger_app_type wsgi|passenger_ruby /usr/bin/ruby2.3|' \
                -e 's|root /var/www/public|root /var/www|' \
        /etc/nginx/sites-enabled/default && \
	/usr/bin/passenger-config validate-install  --auto --no-colors

COPY src /usr/src
=======
	sed -i 's|passenger_app_type wsgi|passenger_ruby /usr/bin/ruby2.3|' /etc/nginx/sites-enabled/default && \
	/usr/bin/passenger-config validate-install  --auto --no-colors && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/*
>>>>>>> 4e127524ada71530e1a71579d24a374d85552923
