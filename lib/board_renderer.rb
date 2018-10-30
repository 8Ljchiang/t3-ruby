require_relative './board.rb'
require_relative './renderer.rb'

class BoardRenderer < Renderer
    def render(board)
        pre_result_storage = []
        line_storage = []
        index = 0 
        while index < board.data.length
            if ((adjust_index_to_position(i)%board.width) == 0)
                fill_string = make_space_buffer(4) + board.data[index] + make_space_buffer(4)
                line_storage.push(fill_string + "\n")
                pre_result_storage.push(create_n_nonline_rows(board, 1) + line_storage.join("|") + create_n_nonline_rows(board, 1))
                line_storage = []
            else
                fill_string = make_space_buffer(4) + board.data[index] + make_space_buffer(4)
                line_storage.push(fill_string)
            end
            index += 1
        end

        return pre_result_storage.join(create_line_row(board))
    end

    private
    def make_space_buffer(count)
        buffer = ""
        index = 1
        while index <= count
            buffer += " "
            index += 1
        end
        return buffer
    end

    def create_nonline_row(board)
        row_line = ""
        index = 0
        while index < board.width
            if index < board.width - 1
                row_line += make_space_buffer(9) + "|"
            else
                row_line += make_space_buffer(9) + "\n"
            end
            index += 1
        end
        return row_line
    end

    def create_n_nonline_rows(board, count)
        fill = ""
        index = 0
        while index < count
            fill += create_nonline_row(board)
            index += 1
        end
        return fill
    end

    def create_line_row(board)
        row_length = (board.width * 9) + board.width - 1
        row_line = ""
        index = 0
        while index < row_length
            if index < (row_length - 1)
                row_line += "-"
            else
                row_line += "-\n"
            end
            index += 1
        end
        return row_line
    end
    
    def adjust_index_to_position(index)
        return index + 1
    end

    def adjust_position_to_index(position)
        return position - 1
    end
end
