defmodule AdventOfCode17.Captcha do
  @moduledoc """
  Resolver the first puzzle Day 1: Inverse Captcha
  """

  def halfway_around_captcha(captcha) when is_integer(captcha) do
    number_list = captcha |> Integer.digits()
    complete_list = List.flatten(number_list, number_list)
    captcha_length = ((number_list |> List.to_string() |> String.length()) / 2) |> round
    steps_forward = captcha_length
    {_, sum} =
      number_list
      |> Enum.reduce({0, 0}, fn(number, acc) ->
        {index, acc_sum} = acc
        {number_at_index, _} = List.pop_at(complete_list, (index + steps_forward))
        case number_at_index == number do
          true ->
            {index + 1, acc_sum + number}
          false ->
            {index + 1, acc_sum}
        end
      end)
      sum
  end

  @doc """
  Solves the first puzzle of the AdventOfCode17
  iex> AdventOfCode17.Captcha.inverse_captcha(91212129)
  9
  """
  def inverse_captcha(captcha) when is_integer(captcha) do
    number_list = captcha |> Integer.digits()
    first_element = number_list |> List.first()
    {_, sum} =
      number_list
      |> List.insert_at(-1, first_element)
      |> Enum.reduce({nil, 0}, fn(number, acc) ->
          {prevNumber, sum} = acc
          case prevNumber == number do
            true ->
              {number, sum + number}
            _ ->
              {number, sum}
          end
        end)
    sum
  end
end
