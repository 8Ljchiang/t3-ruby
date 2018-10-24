require_relative './constants.rb'
require_relative './game_renderer.rb'
require_relative './board_renderer.rb'

class View
    def initialize(args={})
        @game_renderer = args[:game_renderer] || GameRenderer.new
        @board_renderer = args[:board_renderer] || BoardRenderer.new
    end

    def show(text)
        puts text
    end

    def render_game(game)
        case game.state
        when GAME_STATE_NEW
            show(@game_renderer.welcome(game))
        when GAME_STATE_STARTED
            _render_board(game.board)
            show(@game_renderer.render(game))
        when GAME_STATE_END
            _render_board(game.board)
            show(@game_renderer.finale(game))
        when GAME_STATE_CLOSED
            show("The has been quit.")
        else
            show("Error: Unknown Game state.")
        end
    end

    def _render_board(board)
        show(@board_renderer.render(board))
    end
end
