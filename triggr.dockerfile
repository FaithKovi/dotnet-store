FROM ruby:3.4.4-alpine

# Install only the essentials for your gems
RUN apk add --no-cache \
    build-base \
    yaml-dev \
    nodejs \
    yarn \
    tzdata \
    git

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock first (for caching)
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
