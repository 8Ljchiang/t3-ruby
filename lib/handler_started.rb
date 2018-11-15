require_relative './handler.rb'
require_relative './pattern_checker.rb'

class StartedHandler < Handler

    def initialize(args={})
        @checker = args.fetch(:pattern_checker)
    end

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
        current_mark = game.current_player().mark
        game.play_a_position(position)
        if @checker.contains_matching_pattern(game.board.get_marker_positions(current_mark))
            win_positions = @checker.get_matching_pattern(game.board.get_marker_positions(current_mark))
            game.win_info = "#{game.current_player().name} (#{game.current_player().mark}: #{win_positions.join(", ")}) is the winner."
            game.set_state(GAME_STATE_END)
        else
            game.cycle_active_player()
        end
    end
end
