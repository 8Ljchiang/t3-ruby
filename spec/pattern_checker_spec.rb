require_relative '../lib/board.rb'
require_relative '../lib/pattern_checker.rb'

default_win_patterns = [
    "1,5,9",
    "3,5,7",
    "1,2,3",
    "4,5,6",
    "7,8,9",
    "1,4,7",
    "2,5,8",
    "3,6,9"
]

RSpec.describe(PatternChecker) do

    def create_new_board()
        board = Board.new()
        return board
    end

    context "When checking a board for matching patterns" do 

        before(:each) do
            @pattern_checker = PatternChecker.new({ patterns: default_win_patterns})
        end

        it "should return false for 'X' matching a win condition pattern 1,5,9" do
            marker = "X"
            board = create_new_board()
            board.add_mark(marker, 1)
            board.add_mark(marker, 5)
            board.add_mark(marker, 7)
            positions = board.get_marker_positions(marker)
            expect(@pattern_checker.contains_matching_pattern(positions)).to be(false)
        end

        it "should return true for 'X' matching a win condition pattern 1,5,9" do
            marker = "X"
            board = create_new_board()
            board.add_mark(marker, 1)
            board.add_mark(marker, 5)
            board.add_mark(marker, 9)
            positions = board.get_marker_positions(marker)
            expect(@pattern_checker.contains_matching_pattern(positions)).to be(true)
        end
        it "should return true for 'X' matching a win condition pattern 3,5,7" do
            marker = "X"
            board = create_new_board()
            board.add_mark(marker, 3)
            board.add_mark(marker, 5)
            board.add_mark(marker, 7)
            positions = board.get_marker_positions(marker)
            expect(@pattern_checker.contains_matching_pattern(positions)).to be(true)
        end
        it "should return true for 'X' matching a win condition pattern 1,2,3" do
            marker = "X"
            board = create_new_board()
            board.add_mark(marker, 1)
            board.add_mark(marker, 2)
            board.add_mark(marker, 3)
            positions = board.get_marker_positions(marker)
            expect(@pattern_checker.contains_matching_pattern(positions)).to be(true)
        end
        it "should return true for 'X' matching a win condition pattern 4,5,6" do
            marker = "X"
            board = create_new_board()
            board.add_mark(marker, 4)
            board.add_mark(marker, 5)
            board.add_mark(marker, 6)
            positions = board.get_marker_positions(marker)
            expect(@pattern_checker.contains_matching_pattern(positions)).to be(true)
        end
        it "should return true for 'X' matching a win condition pattern 7,8,9" do
            marker = "X"
            board = create_new_board()
            board.add_mark(marker, 7)
            board.add_mark(marker, 8)
            board.add_mark(marker, 9)
            positions = board.get_marker_positions(marker)
            expect(@pattern_checker.contains_matching_pattern(positions)).to be(true)
        end
        it "should return true for 'X' matching a win condition pattern 1,4,7" do
            marker = "X"
            board = create_new_board()
            board.add_mark(marker, 1)
            board.add_mark(marker, 4)
            board.add_mark(marker, 7)
            positions = board.get_marker_positions(marker)
            expect(@pattern_checker.contains_matching_pattern(positions)).to be(true)
        end
        it "should return true for 'X' matching a win condition pattern 2,5,8" do
            marker = "X"
            board = create_new_board()
            board.add_mark(marker, 2)
            board.add_mark(marker, 5)
            board.add_mark(marker, 8)
            positions = board.get_marker_positions(marker)
            expect(@pattern_checker.contains_matching_pattern(positions)).to be(true)
        end
        it "should return true for 'X' matching a win condition pattern 3,6,9" do
            marker = "X"
            board = create_new_board()
            board.add_mark(marker, 3)
            board.add_mark(marker, 6)
            board.add_mark(marker, 9)
            positions = board.get_marker_positions(marker)
            expect(@pattern_checker.contains_matching_pattern(positions)).to be(true)
        end
    end
end