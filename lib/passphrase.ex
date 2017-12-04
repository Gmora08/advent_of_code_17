defmodule AdventOfCode17.Passphrase do
  @moduledoc """
  Day 4 of advent of Code
  """

  def count_valid_passphrases(file) do
    file
    |> read_and_format_file()
    |> Enum.reduce(0, fn(passphrase, acc) ->
      case is_valid_passphrase?(passphrase) do
        {true, _} ->
          acc + 1
        _ ->
          acc
      end
    end)
  end

  def count_valid_passphrases_with_anagrams(file) do
    file
    |> read_and_format_file()
    |> Enum.reduce(0, fn(passphrase, acc) ->
      case is_valid_passphrase_with_anagrams?(passphrase) do
        {true, _} ->
          acc + 1
        _ ->
          acc
      end
    end)
  end

  def read_and_format_file(file) do
    file
    |> File.stream!()
    |> Stream.map(&(String.replace(&1, "\n", "")))
    |> Stream.map(&(String.split(&1, " ")))
    |> Enum.map(&(&1))
  end

  def is_valid_passphrase_with_anagrams?(line) when is_list(line) do
    sorted_line = line |> Enum.map(&sort_words(&1))

    sorted_line
    |> Enum.map(&sort_words(&1))
    |> Enum.reduce_while({true, sorted_line}, fn(_, acc) ->
      {_valid, [head | tail]} = acc
      case Enum.member?(tail, head) do
        true ->
          {:halt, {false, []}}
        false ->
          {:cont, {true, tail}}
      end
    end)
  end

  def sort_words(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
    |> List.to_string
  end

  def is_valid_passphrase?(line) when is_list(line) do
    line
    |> Enum.reduce_while({true, line}, fn(_, acc) ->
      {_valid, [head | tail]} = acc
      case Enum.member?(tail, head) do
        true ->
          {:halt, {false, []}}
        false ->
          {:cont, {true, tail}}
      end
    end)
  end
end
