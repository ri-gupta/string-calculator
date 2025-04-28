require 'test/unit'
require_relative 'calculator'

class CalculatorTest < Test::Unit::TestCase
  def test_empty
    assert_equal 0, Calculator.add(''), "Adding empty string return 0"
  end

  def test_single_number
    assert_equal 22, Calculator.add('22'), "Passing single number string return itself"
  end

end