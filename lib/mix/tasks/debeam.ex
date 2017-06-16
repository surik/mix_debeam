defmodule Mix.Tasks.Debeam do
  use Mix.Task

  alias :beam_lib, as: BeamLib
  alias :erl_syntax, as: ErlSyntax
  alias :erl_prettypr, as: ErlPrettyPr

  @shortdoc "Get Erlang code of built Elixir module"

  def run([module]) do
    file = Path.join([Mix.Project.app_path, "ebin", module]) <> ".beam"
    if File.exists?(file) do
      {:ok, {_, [{:abstract_code, {_, ast}}]}} = 
        to_charlist(file)
        |> BeamLib.chunks([:abstract_code])
      ErlSyntax.form_list(ast)
      |> ErlPrettyPr.format()
      |> IO.puts
      true
    else
      IO.puts "Can find #{module}"
      false
    end
  end
end
