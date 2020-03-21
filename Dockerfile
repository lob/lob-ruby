FROM ruby:2.4.9-alpine3.11

WORKDIR /app
COPY . .
COPY .git .git

# apk add --no-cache --virtual .build-deps python make g++
RUN apk add git make gcc libc-dev g++ openssl-dev
RUN bundle install

CMD bundle exec rake test
