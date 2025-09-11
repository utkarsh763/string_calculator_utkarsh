require_relative '../../app/services/string_calculator'

RSpec.describe StringCalculator do
  describe 'add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns the number itself when one number is given' do
        expect(StringCalculator.add('1')).to eq(1)
    end

    it 'returns the sum of two number' do
        expect(StringCalculator.add('2,3,7,8')).to eq(20)
    end

    it 'handle new lines and comma' do
        expect(StringCalculator.add("1,2\n3")).to eq(6)
    end

    it 'checks custom delimiters' do
        expect(StringCalculator.add("//;\n2;3")).to eq(5)
    end
  end
end
