defmodule AdventOfCode17Test.CaptchaTest do
  use ExUnit.Case
  doctest AdventOfCode17

  test "solve 1212 halfway_around_captcha returns 6" do
    assert AdventOfCode17.Captcha.halfway_around_captcha(1212) == 6
  end

  test "solve 1221 halfway_around_captcha returns 6" do
    assert AdventOfCode17.Captcha.halfway_around_captcha(1221) == 0
  end

  test "solve 123425 halfway_around_captcha returns 6" do
    assert AdventOfCode17.Captcha.halfway_around_captcha(123425) == 4
  end

  test "solve 123123 halfway_around_captcha returns 6" do
    assert AdventOfCode17.Captcha.halfway_around_captcha(123123) == 12
  end

  test "solve 12131415 halfway_around_captcha returns 6" do
    assert AdventOfCode17.Captcha.halfway_around_captcha(12131415) == 4
  end

  test "solve 1122 captcha returns 3" do
    assert AdventOfCode17.Captcha.inverse_captcha(1122) == 3
  end

  test "solve 1111 captcha returns 4" do
    assert AdventOfCode17.Captcha.inverse_captcha(1111) == 4
  end

  test "solve 1234 captcha returns 0" do
    assert AdventOfCode17.Captcha.inverse_captcha(1234) == 0
  end

  test "solve 91212129 captcha returns 9" do
    assert AdventOfCode17.Captcha.inverse_captcha(91212129) == 9
  end

end
