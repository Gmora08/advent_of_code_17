defmodule AdventOfCode17.CorruptionChecksum do
  @moduledoc """
    Day 2: Corruption Checksum
  """

  # TODO: Use flow
  def checksum(file) do
    file
    |> read_file()
    |> Enum.reduce(0, fn(row, acc) ->
      sum_row(row) + acc
    end)
  end

  def evenly_divisible_values(file) do
    file
    |> read_file()
    |> Enum.map(&sort_row/1)
    |> Enum.map(&sum_divisible_rows/1)
    |> Enum.sum()
  end

  defp sum_divisible_rows(row) do
    {_, result} = row
    |> Enum.reduce({row, 0}, fn(number, acc) ->
      {[head| tail], sum} = acc
      result =
        tail
        |> Enum.map(fn(n) ->
          case rem(number, n) do
            0 -> div(number, n)
            _ -> 0
          end
        end)
        |> Enum.sum()
      {List.flatten([tail | [head]]) , sum + result}
    end)
    result
  end

  defp read_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&(String.replace(&1, "\n", "")))
  end

  defp sum_row(row) do
    sorted_row = row |> sort_row()
    List.last(sorted_row) - List.first(sorted_row)
  end

  defp sort_row(row) do
    row
    |> String.trim()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Enum.sort()
  end
end
