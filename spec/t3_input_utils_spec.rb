require_relative '../lib/t3_input_utils.rb'

RSpec.describe T3Engine::InputUtils do
  context 'When calling parse_input with an int' do
    it 'should return the same int value' do
      input = 1
      expected = input

      result = T3Engine::InputUtils.parse_input(input)

      expect(result).to eq(expected)
    end
  end

  context 'When calling parse_input with a valid string' do
    it 'should return the int value of the string' do
      input = '1'
      expected = 1

      result = T3Engine::InputUtils.parse_input(input)

      expect(result).to eq(expected)
    end
  end

  context 'When calling parse_input with an invalid string' do
    it 'should return the int value of the string' do
      input = 'a'
      expected = nil

      result = T3Engine::InputUtils.parse_input(input)

      expect(result).to eq(expected)
    end
  end
end
