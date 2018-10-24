require_relative './renderer.rb'

class GameRenderer < Renderer
    def render(game)
        return "It is #{game.current_player.name}'s turn."
    end

    def welcome(game)
        return "Welcome to Tic Tac Toe\n\nRules: \n1. Choose a position on the board (1-9)\n2. Match three in a row to win."
    end

    def finale(game)
        return "The game has ended."
    end
end