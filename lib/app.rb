require_relative './game.rb'
require_relative './view.rb'
require_relative './player.rb'
require_relative './input_handler.rb'
require_relative './constants.rb'
require_relative './parser.rb'

class App
    def initialize(args={})
        @game = args[:game] || new_game
        @view = args[:view] || View.new
        @parser = args[:parser] || Parser.new
        @input_reader = args[:input_reader] || InputHandler.new(IO.new(1))
    end

    def new_game
        return Game.new({ players: [Player.new("player1", "X"), Player.new("player2", "O")] })
    end

    def run
        game_players = [Player.new("Player1", "X"), Player.new("Player2", "O")]
        game_args = { players: game_players }
        @game = Game.new(game_args)

        while @game.state != GAME_STATE_CLOSED 
            @view.render_game(@game)
            input = @input_reader.get_input("#{@game.current_player.name}: ")
            system "clear"
            @parser.parse(input, @game)
        end
    end
end
