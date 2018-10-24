require_relative './game.rb'
require_relative './view.rb'
require_relative './input_reader.rb'

class App
    def initialize(args={})
        @input_reader = args[:input_reader] || InputHandler.new
        @view = args[:view] || View.new
        @game = nil
    end

    def run
        game_players = [Player.new("Player1", "X"), Player.new("Player2", "O")]
        game_args = { players: game_players }
        @game = Game.new(game_args)

        while @game.state != "end" 
            if @game.state == "new"
                @view.show_welcome(@game)
            elsif @game.state == "started"
                @view.show_game(@game)
                input = @input_reader.get_input(@game.current_player().name() + " select a position (1-9): ")
                @game.play_a_position(input)
            end
        end

        @game.show_finale(@game)
    end
end
