require_relative './handler.rb'

class EndHandler < Handler
  def handle(input, game)
    if is_valid_option(input, game)
      default(input, game)
    else
      error(input, game)
    end
  end

  def options(_input, _game)
    %w[new quit]
  end

  def error(input, game)
    puts 'Options: ' + options(input, game).join(', ')
  end

  def default(input, game)
    case input
    when 'new'
      reset(input, game)
    when 'quit'
      quit(input, game)
    end
  end

  def reset(_input, game)
    game.reset
  end

  def quit
    game.set_game_status('quit')
  end
end
