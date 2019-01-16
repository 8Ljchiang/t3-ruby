# TODO: DELETE

require_relative './game.rb'
require_relative './view.rb'
require_relative './player.rb'
require_relative './input_handler.rb'
require_relative './constants.rb'

class App
  def initialize(args = {})
    @game = args.fetch(:game, new_game)
    @view = args.fetch(:view, View.new)
    @delegator = args.fetch(:delegator)
    @handler_table = args.fetch(:handler_table)
    @input_reader = args.fetch(:input_reader, InputHandler.new(IO.new(1)))
  end

  def new_game
    Game.new(players: [Player.new(DEFAULT_P1, MARKER_1), Player.new(DEFAULT_P2, MARKER_2)])
  end

  def run
    game_players = [Player.new(DEFAULT_P1, MARKER_1), Player.new(DEFAULT_P2, MARKER_2)]
    game_args = { players: game_players }
    @game = Game.new(game_args)

    while @game.game_status != GAME_STATE_CLOSED
      @view.render(@game)
      input = @input_reader.get_input("#{@game.current_player.name}: ")
      system 'clear'
      parse(input, @game)
    end
  end

  def parse(input, game)
    handler = @handler_table[game.game_status.to_sym]
    handler.handle(input, game)
  end
end
