defmodule LatencySimulator.Domain.Behaviours.FileParserBehaviour do
  @moduledoc """
  File parser behaviour
  """

  @callback file_exists?(path :: term) :: boolean
  @callback get_file_type(path :: term) :: binary
  @callback read(path :: term) :: {:ok, result :: term} | {:error, reason :: term}
  @callback decode(path :: term) :: {:ok, result :: term} | {:error, reason :: term}
  @callback parse_yaml(path :: term) :: {:ok, result :: term} | {:error, reason :: term}
  @callback parse_json(path :: term) :: {:ok, result :: term} | {:error, reason :: term}
end
