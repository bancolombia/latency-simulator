defmodule LatencySimulator.MixProject do
  use Mix.Project

  def project do
    [
      app: :latency_simulator,
      version: "0.1.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {LatencySimulator.App, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.6"},
      {:git_hooks, "~> 0.7.3", only: [:dev], runtime: false}
    ]
  end
end
