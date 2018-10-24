require_relative './constants.rb'

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

end