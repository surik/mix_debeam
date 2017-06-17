defmodule MixDebeam.Mixfile do
  use Mix.Project

  def project do
    [app: :mix_debeam,
     version: "0.1.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps(),
     name: "MIX Debeam",
     source_url: "https://github.com/surik/mix_debeam"]
  end

  def application do
    [extra_applications: []]
  end

  defp deps do
    []
  end

  defp description do
    "MIX task to get Erlang code of Elixir module."
  end

  defp package do
    [name: :mix_debeam,
     maintainers: ["Yury Gargay"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/surik/mix_debeam"}]
  end
end
