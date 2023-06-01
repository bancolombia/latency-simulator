defmodule LatencySimulator.Infrastructure.Adapters.Yaml.YamlParser do
  @moduledoc """
  Provides functions for your generic Da
  Example:
  def replace_me(param1, param2) do
    {:ok, param1, param2}
  end
  """
  def parse(content) do
    YamlElixir.read_from_string!(content)
  end
end
