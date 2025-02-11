require IO
require File
require Path
require CSV
require Map

defmodule ParseCsv do
    use ExUnit.Case
    doctest Lambdanet
    
    test "parses csv" do 
        file = File.stream!("test/csv_link_test.csv")
        final = file |> CSV.decode(headers: true) |> Enum.to_list
        assert Enum.all?(final, fn {key, _value} -> key == :ok end)
    end
end