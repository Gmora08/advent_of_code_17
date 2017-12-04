# http://adventofcode.com/2017/day/3

defmodule Day3 do
  require Integer

  def part1(square) do
    final_point =
      memory_points()
      |> Stream.drop_while(&(&1.square != square))
      |> Enum.take(1)
      |> hd()

    abs(final_point.location.x) + abs(final_point.location.y)
  end

  def part2(after_number), do:
    stress_test_values()
    |> Stream.drop_while(&(&1 <= after_number))
    |> Enum.take(1)
    |> hd()

  defp memory_points(), do:
    Stream.transform(
      memory_coordinates(),
      %{square: 1, location: %{x: 0, y: 0}},
      fn location, memory_point ->
        {
          [memory_point],
          %{memory_point | square: memory_point.square + 1, location: location}
        }
      end
    )

  defp stress_test_values(), do:
    Stream.transform(
      memory_coordinates(),
      %{%{x: 0, y: 0} => 1},
      fn location, memory ->
        value = Enum.sum(surrounding_values(memory, location))
        {[value], Map.put(memory, location, value)}
      end
    )

  defp surrounding_values(memory, location) do
    for \
      x <- (location.x - 1)..(location.x + 1),
      y <- (location.y - 1)..(location.y + 1),
      {:ok, value} <- [Map.fetch(memory, %{x: x, y: y})],
      do: value
  end

  defp memory_coordinates(), do:
    path_coordinates(spiral_moves())

  defp path_coordinates(moves), do:
    Stream.scan(
      moves,
      %{x: 0, y: 0},
      fn
        {:left, offset}, coordinate -> update_in(coordinate.x, &(&1 - offset))
        {:right, offset}, coordinate -> update_in(coordinate.x, &(&1 + offset))
        {:up, offset}, coordinate -> update_in(coordinate.y, &(&1 - offset))
        {:down, offset}, coordinate -> update_in(coordinate.y, &(&1 + offset))
      end
    )

  defp spiral_moves(), do:
    Stream.resource(
      fn -> 1 end,
      fn
        size when Integer.is_odd(size) -> {[right: 1, up: size, left: size], size + 1}
        size when Integer.is_even(size) -> {[left: 1, down: size, right: size], size + 1}
      end,
      fn _ -> :ok end
    )
    |> Stream.flat_map(fn {direction, points} -> Stream.map(1..points, fn _ -> {direction, 1} end) end)
end

# System.argv() |> hd() |> String.to_integer() |> Day3.part1() |> IO.inspect()
# System.argv() |> hd() |> String.to_integer() |> Day3.part2() |> IO.inspect()
