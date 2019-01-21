require_relative './class/app.rb'
require_relative './class/handler_end.rb'
require_relative './class/handler_new.rb'
require_relative './class/handler_started.rb'
require_relative './utils/t3_pattern_utils.rb'

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

new_handler = NewHandler.new
started_handler = StartedHandler.new(pattern_checker: tictactoe_pattern_checker)
end_handler = EndHandler.new

handler_table = {
  'new': new_handler,
  'started': started_handler,
  'end': end_handler
}

app_args = {
  game: tictactoe,
  handler_table: handler_table
}

t3 = App.new(app_args)

t3.run
