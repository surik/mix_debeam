# MIX decompiler task [![Build Status](https://travis-ci.org/surik/mix_debeam.svg?branch=master)](https://travis-ci.org/surik/mix_debeam)

MIX task to get Erlang code of Elixir module.

## Installation and usage

Add it to your application

```elixir
def deps do
  [{:mix_debeam, "~> 0.1.0"}, only: [:dev, :test]]
end
```

Then disassembly an Elixir module:

    $ mix debeam Some.Module > some_module.erl
    $ vim some_module.erl

Have fun.
