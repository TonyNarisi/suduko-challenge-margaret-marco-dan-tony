# PSEUDO-CODE

# INPUT:
#   - column_checker, row_checker, box_checker, and box_possibility_checker methods
#   - Begin by iterating through from start
#     - When a box of possibilities is reduced to one number, we go through that row, column, and box to delete that number from any box it hits
#       - If that reduces the box to one number, we repeat this step
#       - If not, we re-start the iteration from the index following the previously solved box
#   - Until the loop hits the last box and no more solutions can be solved, re-start iteration from first box


# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
  sudoku_board = string_breaker(board_string)
  sudoku_board.each_with_index do |row, row_idx|
    row.each_with_index do |square, col_idx|
      if row[col_idx].is_a?(Array)
        row[col_idx] = row_checker(row[col_idx], row_idx, sudoku_board)
        row[col_idx] = column_checker(row[col_idx], col_idx, sudoku_board)
        if row[col_idx].length == 1
          row[col_idx] = row[col_idx][0].to_i
        end
      end
    end
  end
  sudoku_board
end

def string_breaker(sudoku_string)
  sudoku_board = sudoku_string.split('').each_slice(9).to_a
  sudoku_board.map do |sub_arrays|
    sub_arrays.each_with_index do |elm, idx|
      if elm == "-"
        sub_arrays[idx] = [1,2,3,4,5,6,7,8,9]
      else
        sub_arrays[idx] = sub_arrays[idx].to_i
      end
    end
  end
end

def row_checker(array, row_idx, sudoku_board)
  sudoku_board[row_idx].each do |elm|
    if elm.is_a?(Integer)
      array.delete_if {|num| num == elm }
    end
  end
  array
end

def column_checker(array, column_idx, sudoku_board)
  sideways_board = sudoku_board.transpose
  sideways_board[column_idx].each do |elm|
    if elm.is_a?(Integer)
      array.delete_if { |num| num == elm}
    end
  end
  array
end

def box_checker(array, box)
  box.each do |row|
    row.each do |elm|
      if elm.is_a?(Integer)
        array.delete_if { |num| num == elm }
      end
    end
  end
  array
end

def box_possibility_checker
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
end
