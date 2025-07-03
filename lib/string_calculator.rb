# frozen_string_literal: true

class StringCalculator
  def add(string)
    return 0 if string.empty?

    nums = check_delimter(string)
    check_negative(nums)

    nums.sum
  end

  def check_delimter(string)
    delimiter = /[,\n]/
    if string.start_with?('//')
      delimiter_line, numbers = string.split("\n", 2)
      delimiter = delimiter_line[2] || ','
      numbers ||= ''
    end
    string.split(delimiter).map(&:to_i)
  end

  def check_negative(nums)
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
  end
end
