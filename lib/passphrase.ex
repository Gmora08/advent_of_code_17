defmodule AdventOfCode17.Passphrase do
  @moduledoc """
  Day 4 of advent of Code
  """
  def valid_passphrase_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&(String.replace(&1, "\n", "")))
    |> Stream.map(&(String.split(&1, " ")))
    |> Enum.each(&IO.inspect/1)
  end

  def is_valid_passphrase?(line) when is_list(line) do
    line
    |> Enum.reduce_while({true, line}, fn(_, acc) ->
      {[head | tail], _valid} = acc
      case Enum.member?(tail, head) do
        true ->
          {:hatl, {[], false}}
        false ->
          {:cont, {tail, true}}
      end
    end)
  end
end
