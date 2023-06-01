defmodule LatencySimulator.ApplicationTest do
  use ExUnit.Case
  doctest LatencySimulator.Application

  test "test childrens" do
    assert LatencySimulator.Application.env_children(:test) == []
  end
end
