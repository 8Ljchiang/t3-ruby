require_relative './constants.rb'

OFFSET = 1

class Board
    def initialize(args={})
        @height = args[:height]
        @width = args[:width]
        @data = args[:data] || reset()
    end

    def reset
        @data = Array.new(9, OPEN_SPACE)
    end

    def height
        return @height
    end

    def width
        return @width 
    end

    def data
        return @data
    end

    def set_data (data)
        if (data.length == (@height * @width))
            @data = data
        end 
    end

    def is_valid_position(position)
        return position <= (data.length) && position > 0
    end

    def valid_positions
        valid_positions = []
        data.each_with_index do |element, index|
            valid_positions.push(_adjust_index_to_position(index))
        end
        return valid_positions
    end

    def is_position_empty(position)
        if (@data[_adjust_position_to_index(position)] == OPEN_SPACE)
            return true
        else
            return false
        end
    end

    def empty_positions
        empty_positions = Array.new
        @data.each_with_index do |mark, index|
            if (mark == ' ')
                empty_positions.push(_adjust_index_to_position(index))
            end
        end
        return empty_positions
    end

    def get_marker_positions(marker)
        marker_positions = Array.new
        @data.each_with_index do |mark, index|
            if (mark == marker)
                marker_positions.push(_adjust_index_to_position(index))
            end
        end
        return marker_positions
    end

    def add_mark(marker, position)
        if is_valid_position(position) && is_position_empty(position)
            index = _adjust_position_to_index(position)
            @data[index] = marker
        end
    end

    def get_position(position)
        if is_valid_position(position)
            index = _adjust_position_to_index(position)
            return @data[index]
        end
    end


    def _adjust_position_to_index(position)
        return position - OFFSET
    end

    def _adjust_index_to_position(index)
        return index + OFFSET
    end
end