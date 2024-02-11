FROM ruby:2.7.3

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install --quiet --clean

CMD ["jekyll", "serve"]
