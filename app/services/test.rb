require_relative 'string_calculator'

test_cases = {
  "empty string" => "",
  "two numbers comma" => "2,3",
  "two numbers newline" => "2\n3",
  "custom delimiter ;" => "//;\n2;3",
  "multiple numbers" => "1,2,3,4,5",
  "negative numbers" => "2,3,-5,-6"
}

test_cases.each do |description, input|
  begin
    result = StringCalculator.add(input)
    puts "#{description}: input=#{input.inspect} => output=#{result}"
  rescue => e
    puts "#{description}: input=#{input.inspect} => error=#{e.message}"
  end
end
