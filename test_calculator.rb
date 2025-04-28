require 'test/unit'
require_relative 'calculator'

class CalculatorTest < Test::Unit::TestCase
  def test_non_string_error
    assert_raise(ArgumentError, "Invalid input type #{22.class}, expected string of comma / endline separated numbers") do
      Calculator.add(22)
    end
  end

  def test_empty_string
    assert_equal 0, Calculator.add(''), "Adding empty string return 0"
  end

  def test_single_number_string
    assert_equal 22, Calculator.add('22'), "Passing single number string return itself"
  end

  def test_comma_separated_addition
    assert_equal 15, Calculator.add('9,6'), 'Adding comma separated values'
  end

  def test_comma_separated_with_whitespaces
    assert_equal 22, Calculator.add(' 9,6, 7 '), 'Adding comma separated values'
  end

  def test_new_line_separated_additions
    assert_equal 26, Calculator.add('2\n7,9,\n8'), 'Adding comma separated values'
  end
end
