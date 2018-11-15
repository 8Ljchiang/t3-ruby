require_relative './renderer.rb'

class GameRenderer < Renderer
    def render(game)
        case game.state
        when "new"
            return welcome(game)
        when "started"
            return "It is #{game.current_player.name}'s turn."
        when "end"
            return finale(game)
        else
            return ""
        end
    end

    private
    def welcome(game)
        return "Welcome to Tic Tac Toe built in Ruby\n\nRules: \n1. Choose a position on the board (1-9)\n2. Match three in a row to win.\nType 'ready' to begin..."
    end

    def finale(game)
        return "#{game.win_info} \nOptions: 'new', 'quit'"
    end
end