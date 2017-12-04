defmodule AdventOfCode17Test.PassphraseTest do
  use ExUnit.Case
  doctest AdventOfCode17

  test "count_valid_passphrases/1 with passphrase_test.txt returns 2" do
    assert AdventOfCode17.Passphrase.count_valid_passphrases("passphrase_test.txt") == 2
  end

  test "read_and_format_file/1 with passphrase_test.txt" do
    assert AdventOfCode17.Passphrase.read_and_format_file("passphrase_test.txt") == [["aa", "bb", "cc", "dd", "ee"], ["aa", "bb", "cc", "dd", "aa"], ["aa", "bb", "cc", "dd", "aaa"]]
  end

  test "is_valid_passphrase?/1 with [\"aa\", \"bb\", \"cc\", \"dd\", \"ee\"] return {true, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase?(["aa", "bb", "cc", "dd", "ee"]) == {true, []}
  end

  test "is_valid_passphrase?/1 with [\"aa\", \"bb\", \"cc\", \"dd\", \"aa\"] return {false, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase?(["aa", "bb", "cc", "dd", "aa"]) == {false, []}
  end

  test "is_valid_passphrase?/1 with [\"aa\", \"bb\", \"cc\", \"dd\", \"aaa\"] return {true, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase?(["aa", "bb", "cc", "dd", "aaa"]) == {true, []}
  end

  # part 2 tests
  test "is_valid_passphrase_with_anagrams? with [abcde, fghij] returns {true, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase_with_anagrams?(["abcde", "fghij"]) == {true, []}
  end

  test "is_valid_passphrase_with_anagrams? with [abcde, xyz, ecdab] returns {false, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase_with_anagrams?(["abcde", "xyz", "ecdab"]) == {false, []}
  end

  test "is_valid_passphrase_with_anagrams? with [a ab abc abd abf abj] returns {true, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase_with_anagrams?(["a", "ab", "abc", "abd", "abf", "abj"]) == {true, []}
  end

  test "is_valid_passphrase_with_anagrams? with [iiii, oiii, ooii, oooi, oooo] returns {true, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase_with_anagrams?(["iiii", "oiii", "ooii", "oooi", "oooo"]) == {true, []}
  end

  test "is_valid_passphrase_with_anagrams? with [oiii ioii iioi iiio] returns {false, []}" do
    assert AdventOfCode17.Passphrase.is_valid_passphrase_with_anagrams?(["oiii", "ioii", "iioi", "iiio"]) == {false, []}
  end
end
