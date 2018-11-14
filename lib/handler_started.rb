require_relative './handler.rb'
require_relative './pattern_checker.rb'

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

        default_win_patterns = [
            "1,5,9",
            "3,5,7",
            "1,2,3",
            "4,5,6",
            "7,8,9",
            "1,4,7",
            "2,5,8",
            "3,6,9"
        ]
        
        pattern_checker = PatternChecker.new({ patterns: default_win_patterns })
        position = input.to_i
        current_mark = game.current_player().mark
        game.play_a_position(position)
        if pattern_checker.contains_matching_pattern(game.board.get_marker_positions(current_mark))
            game.set_state("end")
        end
    end
end
