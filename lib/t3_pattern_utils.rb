module T3Engine
  module PatternGenerationUtils
    def self.generate_winning_patterns(board)
      patterns = []

      horizontal_patterns = generate_horizontal_row_index_strings(board)
      vertical_patterns = generate_vertical_row_index_strings(board)
      diagonal_patterns = generate_diagonal_index_strings(board)

      patterns.concat(horizontal_patterns)
      patterns.concat(vertical_patterns)
      patterns.concat(diagonal_patterns)

      patterns
      end

    def self.generate_horizontal_row_index_strings(board)
      patterns = []
      row_index_cache = []
      (0..board.height - 1).each do |vertical_adjustment|
        (1..board.width).each do |horizontal_index|
          offset = vertical_adjustment * board.height
          row_index_cache.push(horizontal_index + offset)
        end
        pattern_string = row_index_cache.join(',')
        patterns.push(pattern_string)
        row_index_cache.clear
      end
      patterns
    end

    def self.generate_vertical_row_index_strings(board)
      patterns = []
      column_index_cache = []
      (1..board.width).each do |horizontal_index|
        (0..board.height - 1).each do |vertical_adjustment|
          offset = vertical_adjustment * board.width
          column_index_cache.push(horizontal_index + offset)
        end
        pattern_string = column_index_cache.join(',')
        patterns.push(pattern_string)
        column_index_cache.clear
      end
      patterns
    end

    def self.generate_diagonal_index_strings(board)
      # TODO: implement function
      patterns = []
      diag_pattern_cache = []
      (1..board.width).each do |row_index|
        offset = board.width * (row_index - 1)
        diag_pattern_cache.push(row_index + offset)
      end
      patterns.push(diag_pattern_cache.join(','))
      diag_pattern_cache.clear

      (1..board.height).each do |column_index|
        offset = (board.width - 1) * column_index
        diag_pattern_cache.push(1 + offset)
      end
      patterns.push(diag_pattern_cache.join(','))
      diag_pattern_cache.clear
      patterns
    end
  end
end
