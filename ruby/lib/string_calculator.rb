class NegativesNotAllowedError < StandardError
end

class StringCalculator

  def add(argument = '')
    numbers = argument.gsub(/[^-0-9]/, ',')
    numbers = numbers.split(',')

    return 0 if numbers.empty?

    sum = 0
    numbers.each do |n|
      if n.to_i < 0
        raise NegativesNotAllowedError.new("< negatives not allowed: #{n} >")
      elsif n.to_i < 1000
        sum += n.to_i
      end
    end
    sum

  end

end
