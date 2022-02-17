#!/bin/sh

echo "Starting SSH..."
/usr/sbin/sshd

export RAILS_ENV=production
export RAILS_SERVE_STATIC_FILES=true
export RAILS_LOG_TO_STDOUT=true

echo "Starting Application..."
bundle exec rails server -b 0.0.0.0 -p 3000
