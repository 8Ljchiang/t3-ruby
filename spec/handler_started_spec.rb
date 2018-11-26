require_relative '../lib/handler_started.rb'

RSpec.describe(StartedHandler) do
    def create_mock_game()
        game = spy()
        game_board = instance_double("Board", :empty_positions => [1, 2, 3, 4, 5, 6, 7, 8, 9])
        game.play_a_position
        allow(game).to receive(:state) { "started" }
        allow(game).to receive(:board) { game_board }
        return game
    end

    def create_started_handler()
        return StartedHandler.new()
    end

    context "When testing StartedHandler" do
        it "should make sure that game receives play_a_position", positive: true do
            input = "1"
            game = create_mock_game()
            started_handler = create_started_handler()
            started_handler.handle(input, game)
            expect(game).to have_received(:play_a_position)
        end

        it "should not receive play_a_position" do
            input = "11"
            game = create_mock_game()
            puts game.board
            started_handler = create_started_handler()
            started_handler.handle(input, game)
            expect(game).to_not have_received(:play_a_position)
        end
    end
end