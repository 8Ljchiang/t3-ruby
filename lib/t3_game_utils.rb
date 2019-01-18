require_relative './constants.rb'
require_relative './t3_move_gen_utils.rb'
require_relative './t3_input_utils.rb'

def process_t3_iteration(process_args)
  input = process_args.fetch(:input)
  game = process_args.fetch(:game)
  pattern_checker = process_args.fetch(:pattern_checker)
  with_ai = process_args.fetch(:with_ai)
  current_game_status = determine_game_status(game, pattern_checker)
  game.set_game_status(current_game_status)
  case current_game_status
  when GAME_STATE_STARTED
    move = parse_move_input(input.to_s)
    is_valid_move = is_move_valid(game, move)
    play_round(game, input, with_ai) if is_valid_move
  when GAME_STATE_DRAW
  when GAME_STATE_WINNER
    set_game_winning_info(game, pattern_checker)
  end
end

def play_round(game, position_to_play, with_ai = true)
  if with_ai
    move(game, position_to_play)
    ai_move = generate_random_move(game.board)
    move(game, ai_move)
  elsif
    move(game, position_to_play)
  end
end

def is_move_valid(game, move)
  max_position = game.board.height * game.board.width
  !move.nil? && move > 0 && move < max_position
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
