require_relative './game.rb'
require_relative './view.rb'
require_relative './player.rb'
require_relative './input_handler.rb'
require_relative './constants.rb'

class App
    def initialize(args={})
        @input_reader = args[:input_reader] || InputHandler.new(IO.new(1))
        @view = args[:view] || View.new
        @game = args[:game] || new_game
    end

    def new_game
        return Game.new({ players: [Player.new("player1", "X"), Player.new("player2", "O")] })
    end

    def run
        game_players = [Player.new("Player1", "X"), Player.new("Player2", "O")]
        game_args = { players: game_players }
        @game = Game.new(game_args)

        while @game.state != GAME_STATE_END 
            if @game.state == GAME_STATE_NEW
                @view.render_game(@game)
                input = @input_reader.get_input("Type 'ready' to begin...")
                if (input == 'ready')
                    @game.set_state(GAME_STATE_STARTED)
                end
            elsif @game.state == GAME_STATE_STARTED
                @view.render_game(@game)
                input = @input_reader.get_input(@game.current_player().name() + " select a position (1-9): ")

                @game.play_a_position(input.to_i)
            end
        end

        @view.render_game(@game)
    end
end
