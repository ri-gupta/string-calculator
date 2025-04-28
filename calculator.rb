class Calculator
  def self.add(numbers)
    raise ArgumentError, "Invalid input, expected string of comma / endline separated numbers" unless numbers.is_a? String
    numbers.to_i
  end
end