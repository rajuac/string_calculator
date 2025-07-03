# frozen_string_literal: true

class StringCalculator
  def add(string)
    return 0 if string.empty?

    nums = check_delimter(string)
    check_negative(nums)

    nums.sum
  end

  def check_delimter(string)
    if string.start_with?('//')
      delimiter_part, numbers = string.split("\n", 2)
      numbers ||= ''
      delimiter = if delimiter_part.start_with?('//[')
                    Regexp.new(Regexp.escape(delimiter_part[3...-1]))
                  else
                    Regexp.new(Regexp.escape(delimiter_part[2..] || ','))
                  end
      numbers.split(delimiter).map(&:to_i)

    else
      string.split(/[,\n]/).map(&:to_i)
    end
  end

  def check_negative(nums)
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
  end
end
