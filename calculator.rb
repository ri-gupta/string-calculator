class Calculator
  def self.add(numbers)
    raise ArgumentError, "Invalid input type #{numbers.class}, expected string of comma / endline separated numbers" unless numbers.is_a? String
    
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..-1].split("\n", 2) # split from 2nd char onwards by \n into 2 partsspli
    else
      delimiter = ","
    end

    numbers.split("\n").join(',').split(delimiter).reduce(0) { |sum, num| sum + num.to_i }
  end
end
