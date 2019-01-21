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

  def welcome(_game)
    GAME_WELCOME
  end

  def finale(game)
    "#{game.win_info} \nOptions: 'new', 'quit'"
  end
end
