defmodule LatencySimulator.MixProject do
  use Mix.Project

  def project do
    [
      app: :latency_simulator,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.xml": :test
      ],
      metrics: true
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :opentelemetry_exporter, :opentelemetry],
      mod: {LatencySimulator.Application, [Mix.env()]}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:yaml_elixir, "~> 2.9"},
      {:ex_unit_sonarqube, "~> 0.1", only: :test},
      {:sobelow, "~> 0.11", only: :dev},
      {:credo_sonarqube, "~> 0.1"},
      {:opentelemetry_plug,
       git: "https://github.com/juancgalvis/opentelemetry_plug.git", tag: "master"},
      {:opentelemetry_api, "~> 1.0"},
      {:opentelemetry_exporter, "~> 1.0"},
      {:telemetry, "~> 1.0"},
      {:telemetry_poller, "~> 1.0"},
      {:telemetry_metrics_prometheus, "~> 1.0"},
      {:distillery, "~> 2.1"},
      {:castore, "~> 1.0", override: true},
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.4"},
      {:plug_checkup, "~> 0.6"},
      {:poison, "~> 5.0"},
      {:cors_plug, "~> 3.0"},
      {:timex, "~> 3.0"},
      {:excoveralls, "~> 0.15", only: :test},
      {:git_hooks, "~> 0.7.3", only: [:dev], runtime: false}
    ]
  end
end
