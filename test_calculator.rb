require 'test/unit'
require_relative 'calculator'

class CalculatorTest < Test::Unit::TestCase
  def test_empty
    assert_equal 0, Calculator.add(''), "Adding empty string return 0"
  end

end