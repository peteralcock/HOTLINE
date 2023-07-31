FROM ruby:2.1.4
RUN apt update
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
COPY . .
EXPOSE 3000
CMD bundle exec rails s -b 0.0.0.0
