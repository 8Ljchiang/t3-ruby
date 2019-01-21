require_relative '../lib/constants/constants.rb'
require_relative '../lib/class/player.rb'
require_relative '../lib/class/game.rb'
require_relative '../lib/class/game_renderer.rb'
require_relative './renderer_interface_spec.rb'
require_relative './renderer_subclass_interface_spec.rb'

RSpec.describe(GameRenderer) do
  context 'When creating GameRenderer class' do
    game_args = { players: [Player.new('Mike', 'X'), Player.new('Will', 'O')] }
    game = Game.new(game_args)
    game_renderer = GameRenderer.new
    include_examples('RendererInterfaceTests', game_renderer)
    include_examples('RendererSubclassInterfaceTests', game_renderer)

    context 'When testing GameRenderer methods' do
      before(:each) do
        player1 = 'Mike'
        player2 = 'Will'
        game_args = { players: [Player.new(player1, 'X'), Player.new(player2, 'O')], active_player: 0 }
        @game = Game.new(game_args)
        @game.set_game_status(GAME_STATE_STARTED)
        @renderer = GameRenderer.new
      end

      context '#welcome' do
        it 'should return the game welcome message', positive: true do
          welcome_string = GAME_WELCOME
          expect(@renderer.welcome(@game)).to eq(welcome_string)
        end
      end

      context '#render' do
        it 'should return the game started message', positive: true do
          started_string = "It is Mike's turn."
          expect(@renderer.render(@game)).to eq(started_string)
        end
      end

      context '#finale' do
        it 'should return the game end message', positive: true do
          end_string = "The game has ended with no winner. \nOptions: 'new', 'quit'"
          expect(@renderer.finale(@game)).to eq(end_string)
        end

        it 'should return the game end message when a player has won', positive: true do
          end_string = "Mike (X: 1, 5, 9) is the winner. \nOptions: 'new', 'quit'"
          mark = 'X'
          @game.mark_position(mark, 1)
          @game.mark_position(mark, 5)
          @game.mark_position(mark, 9)


          winning_patterns = T3Engine::PatternGenerationUtils.generate_winning_patterns(@game.board)
          tictactoe_pattern_checker = PatternChecker.new(patterns: winning_patterns)
          win_positions = tictactoe_pattern_checker.get_matching_pattern(@game.board.get_marker_positions(mark))
          @game.win_info = "#{@game.current_player.name} (#{@game.current_player.mark}: #{win_positions.join(', ')}) is the winner."
          @game.set_game_status(GAME_STATE_END)
          expect(@renderer.finale(@game)).to eq(end_string)
        end

        # it 'should return the game end message when the game is a draw', positive: true do
        #   end_string = "The game is a draw. \nOptions: 'new', 'quit'"
        #   mark1 = 'X'
        #   mark2 = 'O'
        #   @game.mark_position(mark1, 1)
        #   @game.mark_position(mark2, 2)
        #   @game.mark_position(mark1, 3)
        #   @game.mark_position(mark1, 4)
        #   @game.mark_position(mark2, 5)
        #   @game.mark_position(mark1, 6)
        #   @game.mark_position(mark2, 7)
        #   @game.mark_position(mark1, 8)
        #   @game.mark_position(mark2, 9)
        #   expect(@renderer.finale(@game)).to eq(end_string)
        # end
      end
    end
  end
end
