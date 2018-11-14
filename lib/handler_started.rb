require_relative './handler.rb'

class StartedHandler < Handler
    def handle(input, game)
        if is_valid_option(input, game)
            default(input, game)
        else
            error(input, game)
        end
    end

    def options(input, game)
        options = []
        game.board.empty_positions.each do |position|
            options.push(position.to_s)
        end
        options
    end

    def error(input, game)
        puts "Options: " + options(input, game).join(", ")
    end

    def default(input, game)
        position = input.to_i
        game.play_a_position(position)
    end
end
