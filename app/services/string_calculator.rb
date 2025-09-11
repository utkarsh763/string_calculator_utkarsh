class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      delimiter_section, numbers = numbers.split("\n", 2)
      delimiter_section.slice!(0, 2) 

      if delimiter_section.start_with?("[")
        delimiters = delimiter_section.scan(/\[([^\]]+)\]/).flatten
      else
        delimiters = [delimiter_section]
      end
    end

    number_list = numbers.split(Regexp.union(delimiters)).map(&:to_i)

    negatives = number_list.select { |n| n < 0 }
    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    number_list.select { |n| n <= 1000 }.sum
  end
end