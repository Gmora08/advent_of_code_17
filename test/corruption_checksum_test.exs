defmodule AdventOfCode17Test.CorruptionChecksumTest do
  use ExUnit.Case
  doctest AdventOfCode17

  test "spreadsheet.txt should return 58975" do
    assert AdventOfCode17.CorruptionChecksum.checksum("spreadsheet.txt") == 58975
  end

  test "spreadsheet2.txt should return 9" do
    assert AdventOfCode17.CorruptionChecksum.evenly_divisible_values("spreadsheet2.txt") == 308
  end
end
