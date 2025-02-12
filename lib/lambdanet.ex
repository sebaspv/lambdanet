defmodule Lambdanet do
    def parse_csv file_name do
        file = File.stream!(file_name)
        file |> CSV.decode(headers: true) |> Enum.to_list
    end

    def populate_graph parsed_enum do
        Enum.map(parsed_enum, fn x -> {String.to_atom(elem(x, 1)["Start"]), String.to_atom(elem(x, 1)["End"]), weight: String.to_integer(elem(x, 1)["Weight"])} end)
    end
end
