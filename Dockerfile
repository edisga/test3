FROM ruby:2.6.6-alpine3.13

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV BUNDLE_VERSION=2.3.6
ENV RAILS_LOG_TO_STDOUT=true
ENV SECRET_KEY_BASE=228ff966fab9676f4a211f4b645ae88f

RUN apk add --update build-base nodejs nodejs-npm yarn build-base postgresql-dev tzdata

RUN apk add openssh \
     && echo "root:Docker!" | chpasswd 

COPY sshd_config /etc/ssh/

RUN mkdir -p /tmp
COPY ssh_setup.sh init_container.sh /tmp
RUN chmod +x /tmp/ssh_setup.sh \
    && (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null)

RUN chmod +x /tmp/init_container.sh

WORKDIR /app

COPY Gemfile* ./

RUN gem install bundler --version "$BUNDLE_VERSION" \
&& rm -rf $GEM_HOME/cache/*

RUN bundle install --without development test

COPY . .

RUN bundle exec rake assets:precompile

EXPOSE 3000 2222

#CMD [ "rails" , "server" , "-b" , "0.0.0.0" , "-e" , "production", "-p", "3000" ]
ENTRYPOINT ["/tmp/init_container.sh"]
