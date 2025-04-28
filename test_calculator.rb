require 'test/unit'
require_relative 'calculator'

class CalculatorTest < Test::Unit::TestCase
  def test_empty
    assert_equal 0, Calculator.add(''), "Adding empty string return 0"
  end

  def test_single_number
    assert_equal 22, Calculator.add('22'), "Passing single number string return itself"
  end

  def test_non_string
    assert_raise(ArgumentError, "Invalid input, expected string of comma / endline separated numbers") do
      Calculator.add(22)
    end
  end


  def test_comma_separated_addition
    assert_equal 15, Calculator.add('9,6'), 'Adding comma separated values'
  end

end