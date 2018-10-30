require_relative './constants.rb'
require_relative './game_renderer.rb'
require_relative './board_renderer.rb'

class View
    def initialize(args={})
        @game_renderer = args.fetch(:game_renderer, GameRenderer.new)
        @board_renderer = args.fecth(:board_renderer, BoardRenderer.new)
    end

    def show(text)
        puts text
    end

    def render_game(game)
        show("Tic Tac Toe")
        case game.state
        when GAME_STATE_NEW
            show(@game_renderer.welcome(game))
        when GAME_STATE_STARTED
            render_board(game.board)
            show(@game_renderer.render(game))
        when GAME_STATE_END
            render_board(game.board)
            show(@game_renderer.finale(game))
        when GAME_STATE_CLOSED
            show("The has been quit.")
        else
            show("Error: Unknown Game state.")
        end
        
    end

    def render_board(board)
        show(@board_renderer.render(board))
    end
end
