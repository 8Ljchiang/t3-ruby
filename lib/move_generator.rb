class MoveGenerator
    def random_move(board)
        empty_positions = board.empty_positions
        random_index = rand(empty_positions.length)
        return empty_positions[random_index]
    end
end