require IO
require File
require Path
require CSV
require Map
require Graph

defmodule ParseCsv do
    use ExUnit.Case
    doctest Lambdanet

    def add_to_adj(start_node, end_node, adj_list) do
        new_adj = adj_list[start_node] ++ [end_node]
        new_adj
    end

    def parse_csv file_name do
        file = File.stream!(file_name)
        file |> CSV.decode(headers: true) |> Enum.to_list
    end

    def populate_graph parsed_enum do
        Enum.map(parsed_enum, fn x -> {String.to_atom(elem(x, 1)["Start"]), String.to_atom(elem(x, 1)["End"]), weight: String.to_integer(elem(x, 1)["Weight"])} end)
    end

    test "parses csv" do
        final = parse_csv "test/csv_link_test.csv"
        assert Enum.all?(final, fn {key, _value} -> key == :ok end)
    end

    test "populate graph and check shortest distance" do
        final = parse_csv("test/csv_link_test.csv") |> populate_graph
        network = Graph.new |> Graph.add_edges(final)
        assert Graph.dijkstra(network, :A, :C) == [:A, :B, :C]
    end
end
