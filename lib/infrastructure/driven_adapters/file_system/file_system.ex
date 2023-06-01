defmodule LatencySimulator.Infrastructure.Adapters.FileSystem do
  alias LatencySimulator.Domain.Behaviours.FileParserBehaviour
  alias LatencySimulator.Infrastructure.Adapters.Yaml.YamlParser
  alias LatencySimulator.Infrastructure.Adapters.Json.JsonParser

  require Logger

  @moduledoc """
  Provides functions for your generic Da
  Example:
  def replace_me(param1, param2) do
    {:ok, param1, param2}
  end
  """

  @behaviour FileParserBehaviour

  @spec file_exists?(String.t()) :: boolean
  def file_exists?(path), do: File.exists?(path)

  @spec get_file_type(String.t()) :: binary
  def get_file_type(path) do
    String.split(path, ".")
    |> List.last()
  end

  @spec read(String.t()) :: {:ok, result :: term} | {:error, reason :: term}
  def read(path) do
    print_file_info(path)
    File.read(path)
  end

  @spec decode(String.t()) :: {:ok, result :: term} | {:error, reason :: term}
  def decode(path) do
    Base.decode64(path, padding: false)
  end

  @spec parse_yaml(String.t()) :: {:ok, result :: term} | {:error, reason :: term}
  def parse_yaml(content) do
    YamlParser.parse(content)
  end

  @spec parse_json(String.t()) :: {:ok, result :: term} | {:error, reason :: term}
  def parse_json(content) do
    JsonParser.parse(content)
  end

  defp print_file_info(path) do
    Logger.info("Reading file: #{path}")
    %{size: size} = File.stat(path)
    Logger.info("File Size: #{size}B\n")
  end
end
