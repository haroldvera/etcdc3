defmodule EtcdcTest do
  use ExUnit.Case
  doctest Etcdc

  test "greets the world" do
    assert Etcdc.hello() == :world
  end
end
