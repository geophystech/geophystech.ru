FROM ruby:2.3.7 AS builder

WORKDIR /app

RUN rm -f /etc/apt/sources.list.d/* \
 && printf '%s\n' \
  'deb http://archive.debian.org/debian stretch main' \
  'deb http://archive.debian.org/debian-security stretch/updates main' \
  > /etc/apt/sources.list \
 && printf '%s\n' \
  'Acquire::Check-Valid-Until "false";' \
  'Acquire::AllowInsecureRepositories "true";' \
  'APT::Get::AllowUnauthenticated "true";' \
  > /etc/apt/apt.conf.d/99archive \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential \
      git \
      nodejs \
 && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 1.15.4 \
 && bundle _1.15.4_ config without 'development:test' \
 && bundle _1.15.4_ install --jobs=4

COPY . .

RUN bundle _1.15.4_ exec middleman build

FROM caddy:2-alpine

WORKDIR /srv
COPY --from=builder /app/build/ /srv/
