require 'rspec'

require 'string_calculator'

describe StringCalculator do

  describe '#add' do
    calculator =StringCalculator.new

    it 'returns 0 if no parameter is provided' do
      result = calculator.add()
      expect(result).to eql(0)
    end

    it 'returns the number if string containing only one number is provided' do
      result = calculator.add("1")
      expect(result).to eql(1)
    end

    it 'returns the sum of numbers if string containing several numbers is provided' do
      result = calculator.add("1,2")
      expect(result).to eql(3)
    end

    it 'returns the sum of numbers if string containing several numbers is provided' do
      result = calculator.add("100,2")
      expect(result).to eql(102)
    end

    it 'returns the number if string containing only one multi-digit number is provided' do
      result = calculator.add("10")
      expect(result).to eql(10)
    end

    it 'returns the sum of numbers if string containing several numbers is provided' do
      result = calculator.add("100,2,5")
      expect(result).to eql(107)
    end

    it 'returns the sum of numbers if string containing several numbers and new lines is provided' do
      result = calculator.add("1\n2,3")
      expect(result).to eql(6)
    end

    it 'returns the sum of numbers if string containing several numbers and new lines is provided' do
      result = calculator.add("1\n2,3")
      expect(result).to eql(6)
    end

    it 'returns the sum even when numbers are separated by multiple &| varying delimiters' do
      result = calculator.add("//;\n1;2")
      expect(result).to eql(3)
    end

    it 'raises a NegativesNotAllowed error if input includes a negative number' do
      expect{ calculator.add("1,4,-1") }.to raise_error(NegativesNotAllowedError)
    end

    it 'returns the sum of numbers only smaller than 1000 if string containing several numbers' do
      result = calculator.add("10002,3,10")
      expect(result).to eql(13)
    end

  end
end
