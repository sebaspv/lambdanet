require IO
require File
require Path
require CSV
require Map

defmodule ParseCsv do
    use ExUnit.Case
    doctest Lambdanet

    def add_to_adj(start_node, end_node, adj_list) do
        adj_list[start_node] ++ [end_node]
    end

    def populate_graph vertices do
        for vertex <- vertices do
            vertex
        end
    end

    test "parses csv" do
        file = File.stream!("test/csv_link_test.csv")
        final = file |> CSV.decode(headers: true) |> Enum.to_list
        aux = []
        for row <- final do
            edge = {elem(row, 1)["Start"], elem(row, 1)["End"], elem(row, 1)["Weight"], elem(row, 1)["Capacity"]}
            add_to_adj(elem(edge, 0), elem(edge, 1), aux)
            IO.inspect edge
        end
        assert Enum.all?(final, fn {key, _value} -> key == :ok end)
    end
end
