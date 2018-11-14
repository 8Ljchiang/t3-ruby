require_relative '../lib/handler_new.rb'

RSpec.describe(NewHandler) do
    def create_mock_game()
        game = spy()
        game.set_state
        allow(game).to receive(:state) { "new" }
        return game
    end

    def create_new_handler()
        return NewHandler.new()
    end

    context "When testing NewHandler" do
        it "should should call set_state on game with 'started'", positive: true do
            input = "ready"
            game = create_mock_game()
            new_handler = create_new_handler()
            new_handler.handle(input, game)
            expect(game).to have_received(:set_state).with("started")
        end
    end
end