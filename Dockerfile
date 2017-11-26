FROM ruby:2.4.1

RUN apt-get update -qq
RUN apt-get install -qqy \
build-essential \
lftp \
nodejs

ENV LANG=C.UTF-8

WORKDIR ./app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

RUN bundle exec middleman build

CMD ./bin/sync.sh
