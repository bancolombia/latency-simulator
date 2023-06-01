import Config

config :latency_simulator, timezone: "America/Bogota"

config :latency_simulator,
  http_port: 8083,
  enable_server: true,
  secret_name: "",
  version: "0.0.1",
  in_test: true,
  custom_metrics_prefix_name: "latency_simulator_test"

config :logger,
  level: :info

# tracer
config :opentelemetry,
  span_processor: :batch,
  traces_exporter: {:otel_exporter_stdout, []}
