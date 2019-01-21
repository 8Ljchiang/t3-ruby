require_relative '../constants/constants.rb'

OFFSET = 1

class Board
  attr_reader :height, :width, :data

  def initialize(args = {})
    @height = args.fetch(:height, 3)
    @width = args.fetch(:width, 3)
    @data = args.fetch(:data, Array.new(@height * @width, OPEN_SPACE))
  end

  def reset
    @data = Array.new(@height * @width, OPEN_SPACE)
  end

  def set_data(data)
    @data = data if data.length == (@height * @width)
  end

  def is_valid_position(position)
    position <= data.length && position > 0
  end

  def valid_positions
    valid_positions = []
    data.each_with_index do |_element, index|
      valid_positions.push(adjust_index_to_position(index))
    end
    valid_positions
  end

  def is_position_empty(position)
    @data[adjust_position_to_index(position)] == OPEN_SPACE
  end

  def empty_positions
    empty_positions = []
    @data.each_with_index do |mark, index|
      empty_positions.push(adjust_index_to_position(index)) if mark == ' '
    end
    empty_positions
  end

  def get_marker_positions(marker)
    marker_positions = []
    @data.each_with_index do |mark, index|
      marker_positions.push(adjust_index_to_position(index)) if mark == marker
    end
    marker_positions
  end

  def add_mark(marker, position)
    if is_valid_position(position) && is_position_empty(position)
      index = adjust_position_to_index(position)
      @data[index] = marker
    end
  end

  def get_position(position)
    if is_valid_position(position)
      index = adjust_position_to_index(position)
      @data[index]
    end
  end

  private

  def adjust_position_to_index(position)
    position - OFFSET
  end

  def adjust_index_to_position(index)
    index + OFFSET
  end
end
