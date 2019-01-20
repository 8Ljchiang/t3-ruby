require_relative '../lib/constants.rb'
require_relative '../lib/t3_game_utils.rb'

RSpec.describe T3Engine::GameUtils do
  context 'When process_iteration is called with a valid position without ai' do
    before(:each) do
      # Initialize players
      player1 = Player.new(DEFAULT_P1, MARKER_1)
      player2 = Player.new(DEFAULT_P2, MARKER_2)

      game_args = { players: [player1, player2] }

      # Initialize Game
      @tictactoe = Game.new(game_args)
      @tictactoe.set_game_status('started')

      # Initialize pattern checking
      winning_patterns = T3Engine::PatternGenerationUtils.generate_winning_patterns(tictactoe.board)
      # puts winning_patterns
      @tictactoe_pattern_checker = PatternChecker.new(patterns: winning_patterns)
    end

    it 'should add the mark to the game board position' do
      move_position = 1
      expected_empty_positions = 8
      process_args = {
        position: move_position,
        game: @tictactoe,
        pattern_checker: @tictactoe_pattern_checker,
        with_ai: false
      }
      T3Engine::GameUtils.process_iteration(process_args)

      expect(@game.board.empty_positions.length).to eq(expected_empty_positions)
      expect(@game.board.is_position_empty(move_position)).to be(false)
      expect(@game.board.get_position(move_position)).to eq(MARKER_1)
    end
  end

  context 'When process_iteration is called with a valid position with ai' do
    before(:each) do
      # Initialize players
      player1 = Player.new(DEFAULT_P1, MARKER_1)
      player2 = Player.new(DEFAULT_P2, MARKER_2)

      game_args = { players: [player1, player2] }

      # Initialize Game
      @tictactoe = Game.new(game_args)
      @tictactoe.set_game_status('started')

      # Initialize pattern checking
      winning_patterns = T3Engine::PatternGenerationUtils.generate_winning_patterns(tictactoe.board)
      # puts winning_patterns
      @tictactoe_pattern_checker = PatternChecker.new(patterns: winning_patterns)
    end

    it 'should add the mark to the game board position' do
      move_position = 1
      expected_empty_positions = 7
      process_args = {
        position: move_position,
        game: @tictactoe,
        pattern_checker: @tictactoe_pattern_checker,
        with_ai: true
      }
      T3Engine::GameUtils.process_iteration(process_args)

      expect(@game.board.empty_positions.length).to eq(expected_empty_positions)
      expect(@game.board.is_position_empty(move_position)).to be(false)
      expect(@game.board.get_position(move_position)).to eq(MARKER_1)
    end
  end
end
