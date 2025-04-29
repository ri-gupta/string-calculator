require 'test/unit'
require_relative 'calculator'

class CalculatorTest < Test::Unit::TestCase
  def test_non_string_error
    assert_raise(ArgumentError, "Invalid input type #{22.class}, expected string of comma / endline separated numbers") do
      Calculator.add(22)
    end
  end

  def test_empty_string
    assert_equal 0, Calculator.add(""), "Adding empty string return 0"
  end

  def test_single_number_string
    assert_equal 22, Calculator.add("22"), "Passing single number string return itself"
  end

  def test_comma_separated_addition
    assert_equal 15, Calculator.add("9,6"), 'Adding comma separated values'

    assert_equal 22, Calculator.add(" 9,6, 7 "), 'Adding comma separated values'
  end

  def test_new_line_separated_additions
    assert_equal 26, Calculator.add("2\n7,9,\n8"), 'Adding comma separated values'
  end

  def test_custom_delimiter
    assert_equal 3, Calculator.add("//;\n1;2"), "Adding numbers separated by ; delimiter in 1st line"

    assert_equal 3, Calculator.add("//\n\n1\n2"), "Adding numbers separated by \n delimiter in 1st line"

    assert_equal 12, Calculator.add("//,\n1\n2,9"), "Adding numbers separated by , delimiter in 1st line"
  end

  def test_avoid_negatives
    assert_raise(ArgumentError, "negative numbers not allowed -41") do
      Calculator.add('-41')
    end

    assert_raise(ArgumentError, "negative numbers not allowed -41,-1") do
      Calculator.add('-41,20,-1,30')
    end
  end

  def test_skip_big_integers
    assert_equal 1099, Calculator.add("//,\n1\n2,9,1000,1002,8,56, 23"), "Should skip any number greater than 1000 in addition"
  end
end
