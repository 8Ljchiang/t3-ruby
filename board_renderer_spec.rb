require_relative './board.rb'
require_relative './board_renderer.rb'

RSpec.describe(BoardRenderer) do
    context "When rendering a Board object" do
        before(:each) do
            size = 3
            @board = Board.new({ height: size, width: 3 })
            @renderer = BoardRenderer.new
        end

        it "it should produce a string representation of the board", positive: true do
            board_string = "         |         |         \n         |         |         \n         |         |         \n-----------------------------\n         |         |         \n         |         |         \n         |         |         \n-----------------------------\n         |         |         \n         |         |         \n         |         |         \n"
            expect(@renderer.render(@board)).to eq(board_string)
        end
    end
end
