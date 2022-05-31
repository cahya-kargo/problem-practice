list = IO.gets("list: ")

list = list |> String.replace("\n", "") |> String.split(" ", trim: true)

result = Enum.reduce(list, %{
    number: [],
    odd_number: [],
    even_number: [],
    text: []
}, fn value, acc ->
    case Integer.parse(value) do
        {init_value, ""} when rem(init_value, 2) == 1 ->
            Map.merge(acc, %{
                number: acc.number ++ [value],
                odd_number: acc.odd_number ++ [value]
            })
        {init_value, ""} when rem(init_value, 2) == 0 ->
            Map.merge(acc, %{
                number: acc.number ++ [value],
                even_number: acc.even_number ++ [value]
            })
        _ ->
            Map.put(acc, :text, acc.text ++ [value])
        end
    end
)
IO.inspect(result)
searchKey = IO.gets("search: ")
searchKey = searchKey |> String.replace("\n", "")

searchResult = Enum.find_index(list, fn v -> 
    v == searchKey
    end
)
IO.inspect(searchResult)
