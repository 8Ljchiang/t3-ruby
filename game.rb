require_relative './board.rb'

class Game
    def initialize(args={})
        @state = "new"
        @players = args[:players]
        @active_player_index = args[:active_player] || _random_player_index
        @board = args[:board] || Board.new
    end

    def play_a_position(position) 
        if (@state == "started")
            @board.add_mark(current_player().mark(), position)
            
            _cycle_active_player()
            
            if (@board.empty_positions().length == 0)
                @state = "end"
            end
        end
    end

    def active_player_index
        return @active_player_index
    end

    def board
        return @board
    end

    def state
        return @state
    end
    
    def set_state(state)
        @state = state
    end

    def current_player
        return @players[active_player_index]
    end

    def players
        return @players
    end
    
    def _random_player_index
        return rand(@players.length)
    end

    def _cycle_active_player
        if (@active_player_index < players.length)
            @active_player_index += 1
        else 
            @active_player_index = 0
        end
    end
end