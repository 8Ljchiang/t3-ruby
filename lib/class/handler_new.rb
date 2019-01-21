require_relative './handler.rb'

class NewHandler < Handler
  def handle(input, game)
    if is_valid_option(input, game)
      default(input, game)
    else
      error(input, game)
    end
  end

  def options(_input, _game)
    ['ready']
  end

  def error(input, game)
    puts 'Options: ' + options(input, game).join(', ')
  end

  def default(input, game)
    case input
    when 'ready'
      ready(input, game)
    end
  end

  def ready(_input, game)
    game.set_game_status(GAME_STATE_STARTED)
  end
end
