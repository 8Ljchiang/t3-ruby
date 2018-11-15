require_relative './renderer.rb'

class GameRenderer < Renderer
  def render(game)
    case game.state
    when 'new'
      welcome(game)
    when 'started'
      "It is #{game.current_player.name}'s turn."
    when 'end'
      finale(game)
    else
      ''
    end
  end

  private

  def welcome(_game)
    "Welcome to Tic Tac Toe built in Ruby\n\nRules: \n1. Choose a position on the board (1-9)\n2. Match three in a row to win.\nType 'ready' to begin..."
  end

  def finale(_game)
    "The game has ended.\nOptions: 'new', 'quit'"
  end
end
