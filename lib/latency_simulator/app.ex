defmodule LatencySimulator.App do
  @moduledoc false

  use Application

  def start(_type, _args) do
    IO.puts("Latency Simulator Started!")

    children = [
      # Use Plug.Cowboy.child_spec/3 to register our endpoint as a plug
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: LatencySimulator,
        options: [port: 8080]
      )
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
