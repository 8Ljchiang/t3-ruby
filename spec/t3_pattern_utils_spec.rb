require_relative '../lib/board.rb'
require_relative '../lib/t3_pattern_utils.rb'

RSpec.describe T3Engine::PatternUtils do
  context 'When calling generate_winning_patterns with size 3 board' do
    it 'should return all possible winning patterns' do
      size = 3
      board = new Board(height: size, width: size)
      expected_array = [
        '1,2,3',
        '4,5,6',
        '7,8,9',
        '1,4,7',
        '2,5,8',
        '3,6,9',
        '1,5,9',
        '3,5,7'
      ]

      result = T3Engine::PatternGenerationUtils.generate_winning_patterns(board)

      expect(result).to match_array(expected_array)
    end
  end
end
