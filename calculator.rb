class Calculator
  def self.add(numbers)
    raise ArgumentError, "Invalid input type #{numbers.class}, expected string of comma / endline separated numbers" unless numbers.is_a? String
    
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..-1].split("\n", 2) # split from 2nd char onwards by \n into 2 partsspli
    else
      delimiter = ","
    end

    nums = numbers.split("\n").join(',').split(delimiter)

    negatives = []
    sum = 0

    nums.each do |num|
      num = num.to_i
      negatives << num if num < 0

      sum += num
    end

    raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?

    sum
  end
end
