#!/usr/bin/env bash

GEM_PATH=$GEM_HOME

if [ ! -x $GEM_HOME/bundler ]; then
    gem install -N bundler
fi

TOUCHFILE=/tmp/local_gems
while [ 1 ]; do
    if [ -f /var/www/Gemfile ]; then
        if [ ! -f $TOUCHFILE ] || [ $TOUCHFILE -ot /var/www/Gemfile ]; then
            echo "Installing local gems"
            bundler install --jobs 40
            if [ -d /var/www/tmp ]; then
                touch /var/www/tmp/restart.txt
            fi
        fi
    fi
    touch $TOUCHFILE
    sleep 10
done
