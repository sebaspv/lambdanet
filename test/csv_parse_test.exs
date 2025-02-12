require IO
require File
require Path
require CSV
require Map
require Graph
require Lambdanet

defmodule ParseCsv do
    use ExUnit.Case
    doctest Lambdanet

    test "parses csv" do
        final = Lambdanet.parse_csv "test/csv_link_test.csv"
        assert Enum.all?(final, fn {key, _value} -> key == :ok end)
    end

    test "populate graph and check shortest distance" do
        final = Lambdanet.parse_csv("test/csv_link_test.csv") |> Lambdanet.populate_graph
        network = Graph.new |> Graph.add_edges(final)
        assert Graph.dijkstra(network, :A, :C) == [:A, :B, :C]
    end
end
