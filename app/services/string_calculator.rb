class StringCalculator 
    def self.add(numbers)
        return 0 if numbers.empty?

        if numbers.start_with?("//")
            delimiter, numbers = numbers.split("\n", 2)
            delimiter = delimiter[2..]
            num_list = numbers.split(delimiter).map(&:to_i)
        else
            delimiters = [",", "\n"]
            num_list = numbers.split(Regexp.union(delimiters)).map(&:to_i)
        end

        negatives = num_list.select { |n| n < 0}
        raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

        num_list.sum
    end
end