require_relative '../lib/class/handler_started.rb'

RSpec.describe(StartedHandler) do
    def create_mock_game()
        game = spy()
        game_board = instance_double("Board", :empty_positions => [1, 2, 3, 4, 5, 6, 7, 8, 9])
        game.play_a_position
        allow(game).to receive(:state) { "started" }
        allow(game).to receive(:board) { game_board }
        return game
    end

    def create_started_handler(checker)
        return StartedHandler.new(pattern_checker: checker)
    end

    context "When testing StartedHandler" do
        # it "should make sure that game receives play_a_position", positive: true do
        #     input = "1"
        #     game = create_mock_game()

        #     size = 3
        #     board = Board.new(height: size, width: size)

        #     # Initialize pattern checking
        #     winning_patterns = T3Engine::PatternGenerationUtils.generate_winning_patterns(board)

        #     # puts winning_patterns
        #     tictactoe_pattern_checker = PatternChecker.new(patterns: winning_patterns)

        #     started_handler = create_started_handler(tictactoe_pattern_checker)
        #     started_handler.handle(input, game)
        #     expect(game).to have_received(:play_a_position)
        # end

        # it "should not receive play_a_position" do
        #     input = "11"
        #     game = create_mock_game()
            
        #     size = 3
        #     board = Board.new(height: size, width: size)

        #     # Initialize pattern checking
        #     winning_patterns = T3Engine::PatternGenerationUtils.generate_winning_patterns(board)

        #     # puts winning_patterns
        #     tictactoe_pattern_checker = PatternChecker.new(patterns: winning_patterns)
            
        #     started_handler = create_started_handler(tictactoe_pattern_checker)
        #     started_handler.handle(input, game)
        #     expect(game).to_not have_received(:play_a_position)
        # end
    end
end