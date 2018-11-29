NegativesError = Class.new(StandardError)

class StringCalculator
  DELIM = ','.freeze

  def parse(obj)
    return unless obj.is_a? String

    parsed = obj.gsub(/[^-0-9.]/, DELIM) # non-digit (except '-' '.') => DELIM
    array = parsed.split(DELIM)
    array.delete('')
    array
  end

  def numerify(string)
    number = string.to_f
    raise NegativesError, "negatives not allowed: #{number}" if number.negative?

    (number % 1).zero? ? number.to_i : number
  end

  def add(obj = '')
    numbers = parse(obj)
    return unless numbers

    return 0 if numbers.empty?

    numbers.map! { |string| numerify(string) }
    numbers.delete_if { |number| 1000 < number }
    numbers.sum
  end
end
