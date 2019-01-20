require_relative './board_renderer.rb'
require_relative './constants.rb'
require_relative './game.rb'
require_relative './pattern_checker.rb'
require_relative './player.rb'
require_relative './t3_game_utils.rb'
require_relative './t3_pattern_utils.rb'
require_relative './t3_input_utils.rb'

# Initialize players
player1 = Player.new(DEFAULT_P1, MARKER_1)
player2 = Player.new(DEFAULT_P2, MARKER_2)

game_args = { players: [player1, player2] }

# Initialize Game
tictactoe = Game.new(game_args)
tictactoe.set_game_status('started')

# Initialize pattern checking
winning_patterns = T3Engine::PatternGenerationUtils.generate_winning_patterns(tictactoe.board)
# puts winning_patterns
tictactoe_pattern_checker = PatternChecker.new(patterns: winning_patterns)

# Play rounds of the game
total_positions = tictactoe.board.width * tictactoe.board.height
(1..total_positions).each do |position|
  puts " >> playing #{position}"
  move_position = T3Engine::InputUtils.parse_move_input(position)
  is_valid_move = T3Engine::GameUtils.is_move_valid(tictactoe, move_position)

  if is_valid_move
    process_args = {
      position: move_position,
      game: tictactoe,
      pattern_checker: tictactoe_pattern_checker,
      with_ai: true
    }
    T3Engine::GameUtils.process_iteration(process_args)
  end

  if tictactoe.game_status != GAME_STATE_STARTED
    break
  end
end

# Show end game information
br = BoardRenderer.new
puts ' >> Each loop finished'
puts "Final game state: #{tictactoe.game_status}"
puts 'Final board: '
puts br.render(tictactoe.board)
