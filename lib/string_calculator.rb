class StringCalculator
  def self.add(input)
    return 0 if input.empty?
    input.tr!("\n", ",")
    input.split(",").map(&:to_i).inject(:+)
  end
end
