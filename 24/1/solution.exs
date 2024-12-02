#!/usr/bin/env elixir

# https://adventofcode.com/2024/day/1

# O(n)

IO.stream()
|> Enum.map(fn (line) ->
  [left, right] = line |> String.split |> Enum.map(&String.to_integer(&1))
  # unzip takes a tuple
  {left, right}
end)
|> Enum.unzip
|> (fn {left, right} -> [Enum.sort(left), Enum.sort(right)] end).()
|> Enum.zip
|> List.foldl(0, fn {left, right}, result -> result + abs(right - left) end)
|> IO.inspect

