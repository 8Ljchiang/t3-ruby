require_relative './handler.rb'

GAME_STATE_STARTED = "started"

class NewHandler < Handler
    # def initialize(args = {})
    #     @options = args.fetch(:options, [])
    # end

    def handle(input, game)
        if is_valid_option(input, game)
            default(input, game)
        else
            error(input, game)
        end
    end

    def options(input, game)
        ["ready"]
    end

    def error(input, game)
        puts "Options: " + options(input, game).join(", ")
    end

    def default(input, game)
        case input
        when "ready"
            ready(input, game)
        end
    end

    def ready(input, game)
        game.set_state(GAME_STATE_STARTED)
    end
end
