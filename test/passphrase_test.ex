defmodule AdventOfCode17Test.PassphraseTest do
  use ExUnit.Case
  doctest AdventOfCode17

  test "is_valid_passphrase?/1 with ["aa", "bb", "cc", "dd", "ee"] return {true, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase?(["aa", "bb", "cc", "dd", "ee"]) == {true, []}
  end

  test "is_valid_passphrase?/1 with ["aa", "bb", "cc", "dd", "aa"] return {false, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase?(["aa", "bb", "cc", "dd", "aa"]) == {false, []}
  end

  test "is_valid_passphrase?/1 with ["aa", "bb", "cc", "dd", "aaa"] return {true, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase?(["aa", "bb", "cc", "dd", "aaa"]) == {true, []}
  end

end
