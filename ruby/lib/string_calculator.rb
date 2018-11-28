class NegativesNotAllowedError < StandardError
end

class StringCalculator

  def add(argument = '')
    numbers = argument.gsub(/\n/, ',')
    numbers = numbers.gsub(/;/, ',')
    numbers = numbers.gsub(%r(/), ',')
    numbers = numbers.split(',')
    # puts numbers
    if numbers.length == 0
      0
    elsif numbers.length == 1
      argument.to_i
    else
      sum = 0
      numbers.each do |n|
        if n.to_i < 0
          raise NegativesNotAllowedError.new("< negatives not allowed: #{n} >")
        end
        sum += n.to_i
      end
      sum
    end
  end

end
