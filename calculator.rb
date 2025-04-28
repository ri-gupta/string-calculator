class Calculator
  def self.add(numbers)
    raise ArgumentError, "Invalid input type #{numbers.class}, expected string of comma / endline separated numbers" unless numbers.is_a? String
    
    numbers.split(',').reduce(0) { |sum, num| sum + num.to_i }
  end
end