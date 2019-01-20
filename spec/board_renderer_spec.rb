require_relative '../lib/board.rb'
require_relative '../lib/board_renderer.rb'
require_relative './renderer_interface_spec.rb'
require_relative './renderer_subclass_interface_spec.rb'

RSpec.describe(BoardRenderer) do
    context "When implementing a BoardRenderer" do
        board_renderer = BoardRenderer.new
        include_examples("RendererInterfaceTests", board_renderer)
        include_examples("RendererSubclassInterfaceTests", board_renderer)
        
        context "When testing a BoardRenderer" do
            before(:each) do
                size = 3
                @board = Board.new({ height: size, width: 3 })
                @renderer = BoardRenderer.new
            end

            it "should be initialized", interface: true do
                expect(@renderer).to_not be(nil)
            end
    
            it "should produce a string representation of the board", positive: true do
                board_string = "         |         |         \n         |         |         \n         |         |         \n-----------------------------\n         |         |         \n         |         |         \n         |         |         \n-----------------------------\n         |         |         \n         |         |         \n         |         |         \n"
                expect(@renderer.render(@board)).to eq(board_string)
            end
        end
    end    
end
