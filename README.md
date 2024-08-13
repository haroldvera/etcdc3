# Etcdc v3 API

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `etcdc` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:etcdc, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/etcdc>.

# etcdc3

config,

export ETCD_URL="http://localhost:port/v3"

## Usage

```elixir
iex> Etcdc.get("key")
{:ok, "value"}  
```

```elixir
iex> Etcdc.put("key", "value")
{:ok, "value"}  
```


