defmodule AdventOfCode17.SpiralMemory do
  require Integer

  def calculate_odd_perfect_squares(top) do
    2..top
    |> Flow.from_enumerable()
    |> Flow.map(&is_odd_perfect_square?/1)
    |> Flow.filter(&(&1 != false))
    |> Enum.sort()
    |> Enum.each(&IO.inspect/1)

    # |> Enum.map(&is_odd_perfect_square?/1)
    # |> Enum.filter(&(&1 != false))
    # |> Enum.each(&IO.inspect/1)
  end

  defp is_odd_perfect_square?(number) do
    sqrt_length = number |> :math.sqrt() |> Float.to_string |> String.split(".") |> List.last() |> String.length()
    case {Integer.is_odd(number), sqrt_length} do
      {true, 1} ->
        number
      _ ->
        false
    end
  end
end
