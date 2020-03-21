FROM ruby:2.4.9-alpine3.11

WORKDIR /app
COPY . .
COPY .git .git

RUN apk add --virtual .build-deps make gcc libc-dev g++ openssl-dev
RUN bundle install
RUN apk del .build-deps

RUN apk add git

CMD bundle exec rake test
