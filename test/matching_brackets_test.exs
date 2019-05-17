defmodule MatchingBracketsTest do
  use ExUnit.Case
  doctest MatchingBrackets

  test "1. does a string have matching brackets?" do
    assert MatchingBrackets.match?("") == true
  end

  test "2. does a string have matching brackets?" do
    assert MatchingBrackets.match?("[()]") == true
  end

  test "3. does a string have matching brackets?" do
    assert MatchingBrackets.match?("{)}") == false
  end

  test "4. does a string have matching brackets?" do
    assert MatchingBrackets.match?("[]") == true
  end

  test "5. does a string have matching brackets?" do
    assert MatchingBrackets.match?("[[[()]]]") == true
  end

  test "6. does a string have matching brackets?" do
    assert MatchingBrackets.match?("[[[(})]]]") == false
  end

  test "7. does a string have matching brackets?" do
    assert MatchingBrackets.match?("({)]}]]") == false
  end

  test "8. does a string have matching brackets?" do
    assert MatchingBrackets.match?("()[](){}") == true
  end

  test "9. does a string have matching brackets?" do
    assert MatchingBrackets.match?("{{") == false
  end

  test "10. does a string have matching brackets?" do
    assert MatchingBrackets.match?("{[}]") == false
  end
end
