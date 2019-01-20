module T3Engine
  module MoveGenerationUtils
    def self.generate_random_move(board)
      board.empty_positions.sample
    end
  end
end
