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

    context "When testing Board class is_valid_position method" do
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

    context "When testing Board class 'valid_positions' method" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end
        
        it "should return an array with values 1-9", positive: true do
            expect(@board.valid_positions).to contain_exactly(1, 2, 3, 4, 5, 6, 7, 8, 9)
        end
    end

    context "When testing Board class postiion mark methods" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end

        it "should return matching array when 'add_mark' is called for positions 1, 5, 7", position: true do
            @board.add_mark("X", 1)
            @board.add_mark("X", 5)
            @board.add_mark("X", 7)
            expect(@board.data).to match_array(["X"," "," "," ","X"," ","X"," "," "])
        end

        it "should return false when is_position_empty for a position where a marker is set", positive: true do
            @board.add_mark("X", 1)
            expect(@board.is_position_empty(1)).to be(false)
        end

        it "should return 'X' and 'O' when getting a position that has the marker at the position index", positive: true do
            @board.add_mark("X", 1)
            @board.add_mark("O", 2)
            expect(@board.get_position(1)).to eq("X")
            expect(@board.get_position(2)).to eq("O")
        end
        
        it "should return true when is_position_empty for positions 1-9", positive: true do
            for i in 1..9 do
                expect(@board.is_position_empty(i)).to be(true)
            end
        end

        it "should return false when is_position_empty is called for all positions on a full board", positive: true do
            for i in 1..9 do
                if i%2 == 0 
                    @board.add_mark("X", i)
                else
                    @board.add_mark("O", i)
                end
                expect(@baord.is_position_empty(i)).to be(false)
            end 
        end

        it "should return an array of all positions for an empty board when 'empty_positions' method is called", positive: true do
            expect(@board.empty_positions).to match_array([1,2,3,4,5,6,7,8,9])
        end

        it "should return an array of empty positions after positions on board", positive: true do
            @board.add_mark("X", 1)
            @board.add_mark("O", 2)
            @board.add_mark("X", 3)
            expect(@board.empty_positions).to match_array([4, 5, 6, 7, 8, 9])
        end

        it "should return an array of length 0 for matching markers on a empty board", positive: true do
            expect(@board.get_marker_positions("X")).to match_array([])
            expect(@board.get_marker_positions("O")).to match_array([])
        end

        it "should return an array of positions that match the marker symbol", positive: true do
            @board.add_mark("X", 1)
            @board.add_mark("O", 2)
            @board.add_mark("X", 3)
            expect(@board.get_marker_positions("X")).to contain_exactly(1,3)
            expect(@board.get_marker_positions("O")).to contain_exactly(2)
        end
    end    
end