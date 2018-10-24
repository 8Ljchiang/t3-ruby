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

    def _adjust_position_to_index(postion)
        return position - OFFSET
    end

    def _adjust_index_to_position(index)
        return index + OFFSET
    end
end