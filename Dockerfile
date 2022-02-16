FROM ruby:2.6.6-alpine3.13

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV BUNDLE_VERSION=2.3.6
ENV RAILS_LOG_TO_STDOUT=true
ENV SECRET_KEY_BASE=61dafd4d9d3fd509304022429751a34a45cb1b3b6eac332099be592f7f7ba921386c9c388611224f58bbcff2ca65d3252ba7c08a941a4f495cfb46edd6804932

RUN apk add --update build-base nodejs nodejs-npm yarn build-base postgresql-dev tzdata

WORKDIR /app

COPY Gemfile* ./

RUN gem install bundler --version "$BUNDLE_VERSION" \
&& rm -rf $GEM_HOME/cache/*

RUN bundle install --without development test

COPY . .

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD [ "rails" , "server" , "-b" , "0.0.0.0" , "-e" , "production", "-p", "3000" ]

