defmodule LatencySimulator.Domain.UseCase.ConfigLoaderUseCase do
  @moduledoc """
  ConfigLoaderUseCase
  """

  @file_parser Application.compile_env(
                 :latency_simulator,
                 :file_parser_behaviour
               )

  def load_from_file(file) do
    with {:ok, content} <- read(file),
         {:ok, parsed} <- decode(content, type(file)) do
      {:ok, parsed}
    else
      {:error, reason} -> {:error, reason}
      error -> {:error, error}
    end
  end

  defp decode(content, "json"), do: @file_parser.parse_json(content)
  defp decode(content, type) when type in ["yaml", "yml"], do: @file_parser.parse_yaml(content)

  defp type(file_name) do
    if @file_parser.file_exists?(file_name) do
      @file_parser.get_file_type(file_name)
    else
      "yaml"
    end
  end

  defp read(file) do
    if @file_parser.file_exists?(file) do
      @file_parser.read(file)
    else
      @file_parser.decode(file)
    end
  end
end
