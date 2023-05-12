FROM elixir:1.14.4-alpine AS builder
WORKDIR /app
ENV MIX_ENV=prod
RUN apk add build-base \
    && mix local.hex --force \
    && mix local.rebar --force
COPY mix.exs mix.lock .
RUN mix deps.get \
    && mix deps.compile
COPY . .
RUN mix release

FROM elixir:1.14.4-alpine
WORKDIR /app
COPY --from=builder /app/_build/prod .
COPY config /app/config
VOLUME /app/config/
ENTRYPOINT exec rel/latency_simulator/bin/latency_simulator start