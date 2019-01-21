require_relative './board.rb'
require_relative '../constants/constants.rb'

class Game
  attr_reader :board, :game_status, :players, :active_player_index, :win_info
  attr_writer :win_info

  def initialize(args = {})
    @game_status = GAME_STATE_NEW
    @players = args.fetch(:players)
    @active_player_index = args.fetch(:active_player, random_player_index)
    @board = args.fetch(:board, Board.new)
    @win_info = 'The game has ended with no winner.'
  end

  def reset
    @game_status = GAME_STATE_NEW
    @active_player_index = random_player_index
    @board.reset
  end

  def set_game_status(status)
    @game_status = status
  end

  def current_player
    @players[@active_player_index]
  end

  def play_a_position(position)
    if @game_status == GAME_STATE_STARTED
      @board.add_mark(current_player.mark, position)

      if @board.empty_positions.empty?
        @win_info = 'The game is a draw.'
        @game_status = GAME_STATE_END
      end
    end
  end

  def cycle_active_player
    if @active_player_index < @players.length - 1
      @active_player_index += 1
    else
      @active_player_index = 0
    end
  end

  private

  def random_player_index
    rand(@players.length)
  end
end
