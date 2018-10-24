require_relative './board.rb'
require_relative './renderer.rb'

class BoardRenderer < Renderer
    def render(board)
        pre_result_storage = []
        line_storage = []

        for i in 0..(board.data.length - 1)
            if (_adjust_index_to_position(i) % board.width == 0)
                fill_string = _make_space_buffer(4) + board.data[i] + _make_space_buffer(4)
                line_storage.push(fill_string + "\n")
                pre_result_storage.push(_create_n_nonline_rows(board, 1) + line_storage.join("|") + _create_n_nonline_rows(board, 1))
                line_storage = []
            else
                fill_string = _make_space_buffer(4) + board.data[i] + _make_space_buffer(4)
                line_storage.push(fill_string)
            end
        end

        return pre_result_storage.join(_create_line_row(board))
    end

    def _make_space_buffer(count)
        buffer = ""
        for counter in 1..count
            buffer += " "
        end
        return buffer
    end

    def _create_nonline_row(board)
        row_line = ""
        for i in 0..(board.width-1)
            if i < board.width - 1
                row_line += _make_space_buffer(9) + "|"
            else
                row_line += _make_space_buffer(9) + "\n"
            end
        end
        return row_line
    end

    def _create_n_nonline_rows(board, count)
        fill = ""
        for i in 0..(count - 1)
            fill += _create_nonline_row(board)
        end
        return fill
    end

    def _create_line_row(board)
        row_length = (board.width * 9) + board.width - 1
        row_line = ""
        for i in 0..(row_length - 1)
            if i < (row_length - 1)
                row_line += "-"
            else
                row_line += "-\n"
            end
        end
        return row_line
    end
    
    def _adjust_index_to_position(index)
        return index + 1
    end

    def _adjust_position_to_index(position)
        return position - 1
    end
end
