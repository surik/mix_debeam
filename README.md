# MIX decompiler task 

[![Build Status](https://travis-ci.org/surik/mix_debeam.svg?branch=master)](https://travis-ci.org/surik/mix_debeam)
[![Package Version](https://img.shields.io/hexpm/v/mix_debeam.svg)](https://hex.pm/packages/mix_debeam)

MIX task to get Erlang code of Elixir module.

## Installation and usage

Add it to your application:

```elixir
def deps do
  [{:mix_debeam, "~> 0.1.0", only: :dev, runtime: false}]
end
```

Then disassembly an Elixir module:

    $ mix debeam Some.Module > some_module.erl
    $ cat some_module.erl
    -compile(no_auto_import).

    -file("lib/simple_module.ex", 1).

    -module('Elixir.Simple.Module').

    -export(['__info__'/1]).
    ...

Have fun.
