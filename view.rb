class View
    def initialize(args={})
        @game_renderer = args[:game_renderer]
        @board_renderer = args[:board_renderer]
    end

    def show(text)
    end

    def render_game(game)
    end

    def _render_board(board)
    end
end
