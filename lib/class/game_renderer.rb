require_relative '../constants/constants.rb'
require_relative './renderer.rb'

class GameRenderer < Renderer
  def render(game)
    case game.game_status
    when GAME_STATE_NEW
      welcome(game)
    when GAME_STATE_STARTED
      "It is #{game.current_player.name}'s turn."
    when GAME_STATE_END
      finale(game)
    else
      ''
    end
  end

  private

  def welcome(_game)
    "Welcome to Tic Tac Toe built in Ruby\n\nRules: \n1. Choose a position on the board (1-9)\n2. Match three in a row to win.\nType 'ready' to begin..."
  end

  def finale(game)
    "#{game.win_info} \nOptions: 'new', 'quit'"
  end
end
