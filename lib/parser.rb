class Parser
    def initialize(args={})
        # @parsing_table = args[:parsing_table] || {
        #     new: {
        #         options: ['ready'],
        #         ready: _new_ready,
        #         default: _new_default,
        #         error: _new_error
        #     },
        #     started: {
        #         options: _started_options,
        #         default: _started_default,
        #         error: _started_error
        #     },
        #     end: {
        #         options: ['close', 'new', 'save'],
        #         close: _end_close,
        #         new: _end_new,
        #         save: _end_save,
        #         default: _end_default,
        #         error: _end_error
        #     }
        # }

        @parsing_table = args[:parsing_table] || {
            "new": {
                options: method(:_new_options),
                ready: method(:_new_ready),
                default: method(:_new_default),
                error: method(:_new_error)
            },
            "started": {
                options: method(:_started_options),
                default: method(:_started_default),
                error: method(:_started_error)
            },
            "end": {
                options: method(:_end_options),
                close: method(:_end_close),
                new: method(:_end_new),
                save: method(:_end_save),
                default: method(:_end_default),
                error: method(:_end_error)
            }
        }
    end

    def parse(input, game)
        case game.state
        when GAME_STATE_NEW
            if (_is_valid_input(input, game))
                ref_cb = @parsing_table.dig(game.state.to_sym, :default)
                _handle(input, game, ref_cb)
            else
                @parsing_table.dig(game.state.to_sym, :error).call(game, input)
            end
        when GAME_STATE_STARTED
            if (_is_valid_input(input, game))
                ref_cb = @parsing_table.dig(game.state.to_sym, :default)
                _handle(input, game, ref_cb)
            else
                @parsing_table.dig(game.state.to_sym, :error).call(game, input)
            end
        when GAME_STATE_END
            if (_is_valid_input(input, game))
                ref_cb = @parsing_table.dig(game.state.to_sym, :default)
                _handle(input, game, ref_cb)
            else
                @parsing_table.dig(game.state.to_sym, :error).call(game, input)
            end
        when GAME_STATE_CLOSED
            puts "Parser: Game State Closed"
        else
            puts "Unrecognized Game State"
        end
    end

    def _handle(input, game, cb)
        cb.call(game, input)
    end

    def _is_valid_input(input, game)
        options = @parsing_table.dig(game.state.to_sym, :options)
        return options.call(game, input).include?(input)
    end

    def _new_options(game, input)
        return ["ready"]
    end

    def _end_options(game, input)
        return ["end", "save", "new"]
    end

    def _started_options(game, input)
        options = []
        game.board.empty_positions.each do |position|
            options.push(position.to_s)
        end
        return options
    end

    def _new_default(game, input)
        @parsing_table.dig(game.state.to_sym, input.to_sym).call(game, input)
    end

    def _started_default(game, input)
        position = input.to_i
        game.play_a_position(position)
    end

    def _end_default(game, input)
        @parsing_table.dig(game.state.to_sym, input.to_sym).(game)
    end

    def _new_ready(game, input)
        game.set_state(GAME_STATE_STARTED)
    end

    def _end_close(game, input)
        game.set_state(GAME_STATE_CLOSED)
    end

    def _end_new(game, input)
        game.reset
    end

    def _new_error(game, input)
        puts "Input not recognized as a valid option."
        puts "Options: " + @parsing_table.dig(game.state.to_sym, :options).call(game, input).join(", ")
    end

    def _started_error(game, input)
        puts "Input not recognized as a valid option."
        puts "Options: " + @parsing_table.dig(game.state.to_sym, :options).call(game, input).join(", ")
    end

    def _end_error(game, input)
        puts "Input not recognized as a valid option."
        puts "Options: " + @parsing_table.dig(game.state.to_sym, :options).call(game, input).join(", ")
    end

    def _end_save(game, input)
    end
end