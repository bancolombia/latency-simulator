defmodule LatencySimulator.Infrastructure.Adapters.Json.JsonParser do
  @moduledoc """
  Provides functions for your generic Da
  Example:
  def replace_me(param1, param2) do
    {:ok, param1, param2}
  end
  """

  def parse(content) do
    Poison.decode!(content)
  end
end
