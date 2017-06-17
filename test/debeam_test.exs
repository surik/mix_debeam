defmodule DebeamTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "run for available module" do
    assert capture_io(fn ->
      assert Mix.Tasks.Debeam.run(["Elixir.Mix.Tasks.Debeam"])
    end)
  end

  test "run for available module without Elixir prefix" do
    assert capture_io(fn ->
      assert Mix.Tasks.Debeam.run(["Mix.Tasks.Debeam"])
    end)
  end

  test "run for non available module" do
    assert capture_io(fn ->
      assert not Mix.Tasks.Debeam.run(["Elixir.Unknown.Module"])
    end)
  end
end
