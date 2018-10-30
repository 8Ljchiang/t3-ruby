class Parser
    def initialize(args={})
        @parsing_table = args[:parsing_table] || {
            "new": {
                options: method(:new_options),
                ready: method(:new_ready),
                default: method(:new_default),
                error: method(:new_error)
            },
            "started": {
                options: method(:started_options),
                default: method(:started_default),
                error: method(:started_error)
            },
            "end": {
                options: method(:end_options),
                close: method(:end_close),
                new: method(:end_new),
                save: method(:end_save),
                default: method(:end_default),
                error: method(:_end_error)
            }
        }
    end

    def parse(input, game)
        case game.state
        when GAME_STATE_NEW
            if (is_valid_input(input, game))
                ref_cb = @parsing_table.dig(game.state.to_sym, :default)
                handle(input, game, ref_cb)
            else
                @parsing_table.dig(game.state.to_sym, :error).call(game, input)
            end
        when GAME_STATE_STARTED
            if (is_valid_input(input, game))
                ref_cb = @parsing_table.dig(game.state.to_sym, :default)
                handle(input, game, ref_cb)
            else
                @parsing_table.dig(game.state.to_sym, :error).call(game, input)
            end
        when GAME_STATE_END
            if (is_valid_input(input, game))
                ref_cb = @parsing_table.dig(game.state.to_sym, :default)
                handle(input, game, ref_cb)
            else
                @parsing_table.dig(game.state.to_sym, :error).call(game, input)
            end
        when GAME_STATE_CLOSED
            puts "Parser: Game State Closed"
        else
            puts "Unrecognized Game State"
        end
    end

    private
    def handle(input, game, cb)
        cb.call(game, input)
    end

    def is_valid_input(input, game)
        options = @parsing_table.dig(game.state.to_sym, :options)
        return options.call(game, input).include?(input)
    end

    def new_options(game, input)
        return ["ready"]
    end

    def new_ready(game, input)
        game.set_state(GAME_STATE_STARTED)
    end

    def new_default(game, input)
        @parsing_table.dig(game.state.to_sym, input.to_sym).call(game, input)
    end

    def started_default(game, input)
        position = input.to_i
        game.play_a_position(position)
    end

    def started_options(game, input)
        options = []
        game.board.empty_positions.each do |position|
            options.push(position.to_s)
        end
        return options
    end

    def end_default(game, input)
        @parsing_table.dig(game.state.to_sym, input.to_sym).call(game, input)
    end

    def end_options(game, input)
        return ["end", "save", "new"]
    end

    def end_close(game, input)
        game.set_state(GAME_STATE_CLOSED)
    end

    def end_new(game, input)
        game.reset
    end

    def new_error(game, input)
        puts "Input not recognized as a valid option."
        puts "Options: " + @parsing_table.dig(game.state.to_sym, :options).call(game, input).join(", ")
    end

    def started_error(game, input)
        puts "Input not recognized as a valid option."
        puts "Options: " + @parsing_table.dig(game.state.to_sym, :options).call(game, input).join(", ")
    end

    def end_error(game, input)
        puts "Input not recognized as a valid option."
        puts "Options: " + @parsing_table.dig(game.state.to_sym, :options).call(game, input).join(", ")
    end

    def end_save(game, input)
    end
end