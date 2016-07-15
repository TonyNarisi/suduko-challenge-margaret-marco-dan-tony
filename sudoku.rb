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
  i = 0
  until solved?(sudoku_board) || i == 500
    sudoku_board.each_with_index do |row, row_idx|
      row.each_with_index do |square, col_idx|
        if row[col_idx].is_a?(Array)
          row[col_idx] = row_checker(square, row_idx, sudoku_board)
          row[col_idx] = column_checker(square, col_idx, sudoku_board)
          row[col_idx] = box_checker(square, row_idx, col_idx, sudoku_board)
          row[col_idx] = box_possibility_checker(square, row_idx, col_idx, sudoku_board)
          row[col_idx] = col_possibility_checker(square, row_idx, col_idx, sudoku_board)
          row[col_idx] = row_possibility_checker(square, row_idx, col_idx, sudoku_board)
          if row[col_idx].length == 1
            row[col_idx] = row[col_idx][0].to_i
          end
        end
      end
    end
    i += 1
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

def row_possibility_checker(array, row_idx, col_idx, sudoku_board)
  sum = []
  sudoku_board[row_idx].each_with_index do |elm, check_col_idx|
    if elm.is_a?(Array)
      if check_col_idx!=col_idx
          sum += elm
        end
      end
    end
     new_sum = array - sum
  if new_sum.length == 1
    array = new_sum
  end
  array
end

def col_possibility_checker(array, row_idx, col_idx, sudoku_board)
  sideways_board = sudoku_board.transpose
  sum = []
  sideways_board[col_idx].each_with_index do |elm, check_row_idx|
    if elm.is_a?(Array)
      if check_row_idx != row_idx
          sum += elm
        end
      end
    end
     new_sum = array - sum
  if new_sum.length == 1
    array = new_sum
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

def box_checker(array, row_idx, col_idx, sudoku_board)
  box_row = row_idx/3
  box_col = col_idx/3
  sudoku_board.each_with_index do |row, check_row_idx|
    row.each_with_index do |elm, check_col_idx|
      if elm.is_a?(Integer)
        if check_row_idx/3 == box_row && check_col_idx/3 == box_col
          array.delete_if { |num| num == elm }
        end
      end
    end
  end
  array
end

def box_possibility_checker(array, row_idx, col_idx, sudoku_board)
  box_row = row_idx/3
  box_col = col_idx/3
  sum = []
  sudoku_board.each_with_index do |row, check_row_idx|
    row.each_with_index do |elm, check_col_idx|
      if elm.is_a?(Array)
        if check_row_idx/3 == box_row && check_col_idx/3 == box_col
          if !(check_row_idx == row_idx && check_col_idx == col_idx)
          sum += elm
          end
        end
      end
    end
  end
  new_sum = array - sum
  if new_sum.length == 1
    array = new_sum
  end
  array
end



# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
  board.all? do |row|
    row.flatten.length == 9 && row.sort == [1,2,3,4,5,6,7,8,9]
    end
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
  board
end
