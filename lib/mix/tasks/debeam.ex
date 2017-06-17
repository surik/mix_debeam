defmodule Mix.Tasks.Debeam do
  use Mix.Task

  @shortdoc "Get Erlang code of built Elixir module"

  @moduledoc """
  Get Erlang code of built Elixir module.

      mix debeam MODULE

  ## Usage

      mix debeam Some.Module > some_module.erl

  Yoy can open `some_module.erl` by any text editor to see Erlang code of your Elixir module.

  """

  alias :beam_lib, as: BeamLib
  alias :erl_syntax, as: ErlSyntax
  alias :erl_prettypr, as: ErlPrettyPr

  def run(["Elixir." <> _ = module]) do
    file = Path.join([Mix.Project.app_path(), "ebin", module]) <> ".beam" 
    if File.exists?(file) do
      debeam(file)
    else
      IO.puts "Can not find #{module}."
      false
    end
  end
  def run([module]), do: run(["Elixir." <> module])

  defp debeam(file) do
    case BeamLib.chunks(to_charlist(file), [:abstract_code]) do
      {:ok, {_, [{:abstract_code, {_, ast}}]}} ->
        ErlSyntax.form_list(ast)
        |> ErlPrettyPr.format()
        |> IO.puts
        true
      _ ->
        IO.puts "#{file} is not a beam file."
        false
    end
  end
end
