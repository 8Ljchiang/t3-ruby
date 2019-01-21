require_relative '../lib/class/handler_end.rb'

RSpec.describe(EndHandler) do
    def create_mock_game()
        game = spy()
        allow(game).to receive(:reset)
        allow(game).to receive(:state) { "end" }
        return game
    end

    def create_end_handler()
        return EndHandler.new()
    end

    context "When testing EndHandler" do
        it "should call 'reset' on game", positive: true do
            input = "new"
            game = create_mock_game()
            end_handler = create_end_handler()
            end_handler.handle(input, game)
            expect(game).to have_received(:reset)
        end
    end
end