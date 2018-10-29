require_relative '../lib/board.rb'

RSpec.describe(Board) do 

    # Testing Helper for creating Board object
    def create_board(args={})
        board = Board.new(args)
        return board
    end

    context "When creating a Board class" do
        it "should instantiate a Board object", positive: true do
            board = create_board()
            expect(board).to_not be(nil)
        end
    end

    context "When tesing Board class methods" do

        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end

        it "#height should return '3'", positive: true do
            expect(@board.height).to eq(3)
        end

        it "#width should return '3'", positive: true do
            expect(@board.height).to eq(3)
        end

        it "#data should return an array of length '9' and be filled with open spaces", positive: true do
            expect(@board.data).to match_array([" "," "," "," "," "," "," "," "," ",])
        end
    end

    context "#is_valid_position" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end

        it "#should return false for -1, 0, and 10", positive: true do
            expect(@board.is_valid_position(0)).to be(false)
            expect(@board.is_valid_position(10)).to be(false)
        end

        it "should return true for 1-9", positive: true do
            for i in 1..9 do
                expect(@board.is_valid_position(i)).to be(true)
            end
        end
    end

    context "#valid_positions" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end
        
        it "should return an array with values 1-9", positive: true do
            expect(@board.valid_positions).to contain_exactly(1, 2, 3, 4, 5, 6, 7, 8, 9)
        end
    end

    context "#add_mark" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end

        it "should set mark on board and baord data should show marks at positions: 1, 5, 7", position: true do
            @board.add_mark("X", 1)
            @board.add_mark("X", 5)
            @board.add_mark("X", 7)
            expect(@board.data).to match_array(["X"," "," "," ","X"," ","X"," "," "])
        end
    end

    context "#is_position_empty" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end
        
        it "should return false for a position where a marker is already set", positive: true do
            @board.add_mark("X", 1)
            expect(@board.is_position_empty(1)).to be(false)
        end

        it "should return true for all positions on an empty board", positive: true do
            for i in 1..9 do
                expect(@board.is_position_empty(i)).to be(true)
            end
        end

        it "should return false for all positions on a full board", positive: true do
            for i in 1..9 do
                if i%2 == 0 
                    @board.add_mark("X", i)
                else
                    @board.add_mark("O", i)
                end
                expect(@board.is_position_empty(i)).to be(false)
            end 
        end
    end

    context "#get_position" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end

        it "should return marks when getting a marked position", positive: true do
            @board.add_mark("X", 1)
            @board.add_mark("O", 2)
            expect(@board.get_position(1)).to eq("X")
            expect(@board.get_position(2)).to eq("O")
        end
    end
    
    context "#empty_positions" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end

        it "should return an array of all positions (1-9) for an empty board of size 3", positive: true do
            expect(@board.empty_positions).to match_array([1,2,3,4,5,6,7,8,9])
        end

        it "should return an array of empty positions after positions have been marked on the board", positive: true do
            @board.add_mark("X", 1)
            @board.add_mark("O", 2)
            @board.add_mark("X", 3)
            expect(@board.empty_positions).to match_array([4, 5, 6, 7, 8, 9])
        end
    end

    context "#get_marker_positions" do
        before(:each) do
            size = 3
            @board = create_board({ height: size, width: size })
        end

        it "should return an array of length 0 for matching markers on a empty board", positive: true do
            expect(@board.get_marker_positions("X")).to match_array([])
            expect(@board.get_marker_positions("O")).to match_array([])
        end

        it "should return an array of positions that corresponds to marked positions", positive: true do
            @board.add_mark("X", 1)
            @board.add_mark("O", 2)
            @board.add_mark("X", 3)
            expect(@board.get_marker_positions("X")).to contain_exactly(1,3)
            expect(@board.get_marker_positions("O")).to contain_exactly(2)
        end
    end    
end