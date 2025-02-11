defmodule LambdanetTest do
  use ExUnit.Case
  doctest Lambdanet

  test "greets the world" do
    assert Lambdanet.hello() == :world
  end
end
