# Gem Name: 't3'

## Description: 
t3 is a ruby gem that contains a tic tac toe game class that can be utilized to write your own implementation of the game. It also contains a cli implementation that can be played as well.

## Details

Built using ruby version: `2.3.7p456`

## Usage

To run t3 in the command line:
```
t3
```

To use t3 cli main code:
```
Main.start
```

To create t3 game instance:
```
require 'class/app'
require 'class/handler_end'
require 'class/handler_new'
require 'class/handler_started'
require 'utils/t3_pattern_utils'

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
```