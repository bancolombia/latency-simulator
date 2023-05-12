defmodule LatencySimulatorTest do
  use ExUnit.Case
  use Plug.Test
  doctest LatencySimulator

  @opts LatencySimulator.init([])

  test "get request" do
    conn = :get |> conn("/wait/1000") |> LatencySimulator.call(@opts)
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK After 1000 milliseconds"
  end

  test "bad get request" do
    conn = :get |> conn("/wait/x") |> LatencySimulator.call(@opts)
    assert conn.state == :sent
    assert conn.status == 500
    assert conn.resp_body == "Please specify an integer in the form: /wait/:time_to_wait"
  end

  test "bad request" do
    conn = :get |> conn("/something") |> LatencySimulator.call(@opts)
    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "oops... Nothing here :("
  end
end
