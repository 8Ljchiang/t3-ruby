require_relative './board.rb'

RSpec.describe(Board) do 

    # Testing Helper for creating Board object
    def create_board(args={})
        board = Board.new(args)
        return board
    end

    context "When creating a Board class" do
        it "should instantiate a Board object", positive: true do

        end
    end

    context "When tesing Board class methods" do

        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end

        it "should return '3' when 'height' is called", positive: true do
            expect(@board.height).to eq(3)
        end

        it "should return '3' when 'width' is called", positive: true do
            expect(@board.height).to eq(3)
        end

        it "should return an array with length that contains 9 ' ' when 'data' is called", positive: true do
            expect(@board.data).to match_array([" "," "," "," "," "," "," "," "," ",])
        end
    end

    context "When testing Board class position methods" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end

        it "should return false when is_valid_position is called for 0 & 10", positive: true do
            expect(@board.is_valid_position(0)).to be(false)
            expect(@board.is_valid_position(10)).to be(false)
        end

        it "should return true when is_valid_position is called for 1-9", positive: true do
            for i in 1..9 do
                expect(@board.is_valid_position(i)).to be(true)
            end
        end
    end
end