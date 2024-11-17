defmodule SaludoAppTest do
  use ExUnit.Case
  doctest SaludoApp

  test "greets the world" do
    assert SaludoApp.hello() == :world
  end
end
