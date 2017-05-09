require "string_calculator"

describe StringCalculator do
  describe ".add" do
    context "given an empty string" do
      it "returns zero" do
        expect(StringCalculator.add("")).to eql(0)
      end
    end

    context "given '4'" do
      it "returns 4" do
        expect(StringCalculator.add("4")).to eql(4)
      end
    end

    context "given '10'" do
      it "returns 10" do
        expect(StringCalculator.add("10")).to eql(10)
      end
    end

    context "two numbers" do
      context "given '2, 4'" do
        it "returns 6" do
          expect(StringCalculator.add("2, 4")).to eql(6)
        end
      end

      context "given '17,100'" do
        it "returns 117" do
          expect(StringCalculator.add("17,100")).to eql(117)
        end
      end
    end

    context "unknown amount of numbers" do
      context "given '2, 9, 6, 7, 4, 5, 6, 456'" do
        it "returns 495" do
          expect(StringCalculator.add("2, 9, 6, 7, 4, 5, 6, 456")).to eql(495)
        end
      end

      context "given '182,234, 97,463, 24,239'" do
        it "returns 1239" do
          expect(StringCalculator.add("182,234, 97,463, 24,239")).to eql(1239)
        end
      end
    end

    context "handle new lines between numbers" do
      context "given '1\n2,3'" do
        it "returns 6" do
          expect(StringCalculator.add("1\n2,3")).to eql(6)
        end
      end
    end

    context "support different delimiters" do
      context "given '//;\n1;2'" do
        it "returns 3" do
          expect(StringCalculator.add("//;\n1;2")).to eql(3)
        end
      end

      context "given '...\n1-2-3-4'" do
        it "returns 10" do
          expect(StringCalculator.add("...\n1-2-3-4")).to eql(10)
        end
      end
    end

    context "negative numbers" do
      context "given '-5, -5'" do
        it "raises exception 'negatives not allowed: [-5, -5]'" do
          expect { StringCalculator.add("-5, -5") }
            .to raise_error("negatives not allowed: [-5, -5]")
        end
      end
    end
  end
end
