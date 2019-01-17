require_relative './constants.rb'

def play_round(game, position_to_play, pattern_checker)
  current_game_status = determine_game_status(game, pattern_checker)
  game.set_game_status(current_game_status)
  case current_game_status
  when GAME_STATE_STARTED
    move(game, position_to_play)
  when GAME_STATE_DRAW
    
  when GAME_STATE_WINNER
    set_game_winning_info(game, pattern_checker)
  else

  end
end

def parse_move_input(input)
  begin
    if input.is_a? Integer
      return input
    else
      return Integer(input, 10)
    end
  rescue => exception
    return nil
  end
end

def is_move_valid(game, move)
  max_position = game.board.height * game.board.width
  return move != nil && move > 0 && move < max_position
end

def move(game, position)
  if game.board.is_position_empty(position)
    game.play_a_position(position)
    game.cycle_active_player
  end
end

def set_game_winning_info(game, pattern_checker)
  marker_positions = game.board.get_marker_positions(MARKER_1) 
  win_positions = pattern_checker.get_matching_pattern(marker_positions)
  winning_message = "(#{game.current_player.mark}: #{win_positions.join(', ')}) is the winner."
  game.win_info = "#{game.current_player.name} #{winning_message}"
end

def determine_game_status(game, pattern_checker)
  game_status = if contains_pattern(game.board, MARKER_1, pattern_checker)
                  GAME_STATE_WINNER
                elsif contains_pattern(game.board, MARKER_2, pattern_checker)
                  GAME_STATE_WINNER
                elsif game.board.empty_positions.empty?
                  GAME_STATE_DRAW
                else
                  GAME_STATE_STARTED
          end
  game_status
end

def contains_pattern(board, marker, pattern_checker)
  marker_positions = board.get_marker_positions(marker)
  pattern_checker.contains_matching_pattern(marker_positions)
end

def generate_winning_patterns(board)
  patterns = []

  horizontal_patterns = generate_horizontal_row_index_strings(board)
  vertical_patterns = generate_vertical_row_index_strings(board)
  diagonal_patterns = generate_diagonal_index_strings(board)

  patterns.concat(horizontal_patterns)
  patterns.concat(vertical_patterns)
  patterns.concat(diagonal_patterns)

  patterns
end

def generate_horizontal_row_index_strings(board)
  patterns = []
  row_index_cache = []
  (0..board.height - 1).each do |vertical_adjustment|
    (1..board.width).each do |horizontal_index|
      offset = vertical_adjustment * board.height
      row_index_cache.push(horizontal_index + offset)
    end
    pattern_string = row_index_cache.join(',')
    patterns.push(pattern_string)
    row_index_cache.clear
  end
  patterns
end

def generate_vertical_row_index_strings(board)
  patterns = []
  column_index_cache = []
  (1..board.width).each do |horizontal_index|
    (0..board.height - 1).each do |vertical_adjustment|
      offset = vertical_adjustment * board.width
      column_index_cache.push(horizontal_index + offset)
    end
    pattern_string = column_index_cache.join(',')
    patterns.push(pattern_string)
    column_index_cache.clear
  end
  patterns
end

def generate_diagonal_index_strings(board)
  # TODO: implement function
  patterns = []
  diag_pattern_cache = []
  (1..board.width).each do |row_index|
    offset = board.width * (row_index - 1)
    diag_pattern_cache.push(row_index + offset)
  end
  patterns.push(diag_pattern_cache.join(','))
  diag_pattern_cache.clear

  (1..board.height).each do |column_index|
    offset = (board.width - 1) * column_index
    diag_pattern_cache.push(1 + offset)
  end
  patterns.push(diag_pattern_cache.join(','))
  diag_pattern_cache.clear
  patterns
end
