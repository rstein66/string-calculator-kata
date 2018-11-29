NoNegativesError = Class.new(StandardError)

class StringCalculator
  DELIM = ','.freeze

  def parse(obj = '')
    return unless obj.is_a? String

    # substitute all non-digits (except '-' & '.') with DELIM
    parsed = obj.gsub(/[^-0-9.]/, DELIM)
    parsed = parsed.split(DELIM)
    parsed.delete('')
  end

  def add(obj = '')
    puts "obj: #{obj}"
    numbers = parse(obj)
    puts "numbers: #{numbers.inspect}"
    return unless numbers

    return 0 if numbers.empty?

    err_msg = 'negatives not allowed'
    sum = 0
    numbers.each do |n|
      raise NoNegativesError, "#{err_msg}: #{n}" if n.to_f.negative?

      sum += n.to_i
    end
    sum
  end
end
