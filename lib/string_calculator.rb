class StringCalculator
  def self.add(input)
    return 0 if input.empty?
    input = sanitize(input)
    check_for_negative(input)
    input.inject(:+)
  end

  def self.sanitize(input)
    delimiter = input.match(/\d\s?(\W)\s?\d/)
    input.tr!(delimiter[1], ",") if delimiter
    input.tr!("\n", ",")
    input.split(",").map(&:to_i)
  end

  def self.check_for_negative(input)
    raise Exception, "negatives not allowed: #{input}" if
      input.any? { |number| number < 0 }
  end
end
