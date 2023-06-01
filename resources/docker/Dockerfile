# build stage
FROM elixir:1.14.5-alpine AS builder
ENV APP_NAME=latency_simulator
ENV MIX_ENV=prod
WORKDIR /app
RUN apk update --no-cache && \
    apk upgrade --available --purge --no-cache && \
    apk add build-base git
RUN mix local.hex --force && \
    mix local.rebar --force
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile
COPY . ./
RUN mix release

# runtime stage
FROM elixir:1.14.5-alpine
ENV APP_NAME=latency_simulator
ENV MIX_ENV=prod
WORKDIR /app
EXPOSE 8083
RUN apk update --no-cache && \
    apk upgrade --available --purge --no-cache && \
    rm -rf /var/cache/apk/*
COPY --from=builder /app/_build/prod ./
ENTRYPOINT exec ./rel/$APP_NAME/bin/$APP_NAME start
