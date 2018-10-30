require_relative './board.rb'
require_relative './constants.rb'

class Game
    attr_reader :board, :state, :players, :active_player_index

    def initialize(args={})
        @state = GAME_STATE_NEW
        @players = args.fetch(:players)
        @active_player_index = args.fetch(:active_player, random_player_index)
        @board = args.fetch(board, Board.new)
    end

    def reset
        @state = GAME_STATE_NEW
        @active_player_index = random_player_index
        @board.reset
    end

    def set_state(state)
        @state = state
    end

    def current_player
        return @players[@active_player_index]
    end

    def play_a_position(position) 
        if (@state == GAME_STATE_STARTED)
            @board.add_mark(current_player().mark(), position)
            
            cycle_active_player()
            
            if (@board.empty_positions().length == 0)
                @state = GAME_STATE_END
            end
        end
    end

    private 
    def random_player_index
        return rand(@players.length)
    end

    def cycle_active_player
        if (@active_player_index < @players.length - 1)
            @active_player_index += 1
        else 
            @active_player_index = 0
        end
    end
end