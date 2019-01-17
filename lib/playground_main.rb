require_relative './board_renderer.rb'
require_relative './constants.rb'
require_relative './game.rb'
require_relative './pattern_checker.rb'
require_relative './player.rb'
require_relative './t3_helper_functions.rb'

# Initialize players
player1 = Player.new(DEFAULT_P1, MARKER_1)
player2 = Player.new(DEFAULT_P2, MARKER_2)

game_args = { players: [player1, player2] }

# Initialize Game
tictactoe = Game.new(game_args)
tictactoe.set_game_status('started')

# Initialize pattern checking
winning_patterns = generate_winning_patterns(tictactoe.board)
# puts winning_patterns
tictactoe_pattern_checker = PatternChecker.new(patterns: winning_patterns)

# Play rounds of the game
total_positions = tictactoe.board.width * tictactoe.board.height
(1..total_positions).each do |position|
  puts " >> playing #{position}"
  move = parse_move_input(position.to_s)
  is_valid_move = is_move_valid(tictactoe, move)
  play_round(tictactoe, move, tictactoe_pattern_checker) if is_valid_move
end

# Show end game information
br = BoardRenderer.new
puts ' >> Each loop finished'
puts "Final game state: #{tictactoe.game_status}"
puts 'Final board: '
puts br.render(tictactoe.board)
