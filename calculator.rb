class Calculator
  def self.add(numbers)
    validate_string_input(numbers)

    delimiters, numbers = extract_delimiter_and_numbers(numbers)
    nums = parse_numbers(numbers, delimiters)

    validate_no_negatives(nums)
    select_numbers_upto(nums, 1000)

    nums.sum
  end

  private

  def self.validate_string_input(numbers)
    unless numbers.is_a? String
      raise ArgumentError, "invalid input type #{numbers.class}, expected string of comma or endline separated numbers"
    end
  end

    def self.extract_delimiter_and_numbers(numbers)
      if numbers.start_with?("//")
        delimiter_section, numbers = numbers[2..-1].split("\n", 2)
        if delimiter_section.start_with?("[") && delimiter_section.end_with?("]")
          delimiters = delimiter_section.split("][")

          delimiters[0] = delimiters[0][1..-1] # skip the first [ for first delimiter
          delimiters[-1] = delimiters[-1][0..-2] # skip the last ] for last delimiter
        else
          delimiters = [delimiter_section]
        end
        [delimiters, numbers]
      else
        [[","], numbers]
      end
    end

  def self.parse_numbers(numbers, delimiters)
    regexp = "\\n"

    delimiters.each { |d| regexp << "|#{Regexp.escape(d)}"}

    numbers.split(Regexp.new(regexp)).map(&:to_i)
  end

  def self.validate_no_negatives(nums)
    negatives = nums.select { |num| num < 0 }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
    end
  end

  def self.select_numbers_upto(nums, max_limit)
    nums.select! { |num| num <= max_limit }
  end
end
