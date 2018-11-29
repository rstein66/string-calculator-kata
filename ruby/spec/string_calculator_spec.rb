require 'rspec'

require 'string_calculator'

describe StringCalculator do

  describe '#add' do
    calculator = StringCalculator.new

    context 'when no parameters are provided' do
      it 'returns 0' do
        result = calculator.add
        expect(result).to eql(0)
      end
    end

    context 'when provided exactly one parameter, which is a String' do
      it 'returns 0 when input string is empty' do
        result = calculator.add('')
        expect(result).to eql(0)
      end

      it 'returns number when given exactly one, one-digit, number' do
        result = calculator.add("5")
        expect(result).to eql(5)
      end

      it 'sums numbers when given several, comma-separated, numbers' do
        result = calculator.add("100,2")
        expect(result).to eql(102)
      end

      it 'returns number when given one, one or multi-digit, number' do
        result = calculator.add("10")
        expect(result).to eql(10)
      end

      it 'sums numbers when given several, comma-separated, numbers' do
        result = calculator.add("100,2,5")
        expect(result).to eql(107)
      end

      it 'sums numbers when given several, comma &| newline separated, numbers' do
        result = calculator.add("1\n2,3")
        expect(result).to eql(6)
      end

      it 'sums numbers when given numbers and multiple &| varying delimiters' do
        result = calculator.add(" //;\n1; 2| ")
        expect(result).to eql(3)
      end

      it 'raises error when given at least one negative number' do
        expect{ calculator.add("1,4,-1//") }.to raise_error(NegativesError)
      end

      it 'sums numbers represented as ints or floats (when all nonnegative)' do
        result = calculator.add("100;2.5;5.25")
        expect(result).to eql(107.75)
      end

      it 'sums all numbers smaller than one thousand (when all nonnegative)' do
        result = calculator.add("0, ;10002;306., 9900.90\n| 3.0||\n,1")
        expect(result).to eql(310)
      end
    end
  end
end
