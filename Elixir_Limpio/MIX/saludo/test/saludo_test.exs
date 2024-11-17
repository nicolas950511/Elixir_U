defmodule SaludoTest do
  use ExUnit.Case
  doctest Saludo

  test "greets the world" do
    assert Saludo.hello() == :world
  end
end
