class StringCalculator
  def self.add(input)
    return 0 if input.empty?
    delimiter = input.match(/\d\s?(\W)\s?\d/)
    input.tr!(delimiter[1], ",") if delimiter
    input.tr!("\n", ",")
    input.split(",").map(&:to_i).inject(:+)
  end
end
