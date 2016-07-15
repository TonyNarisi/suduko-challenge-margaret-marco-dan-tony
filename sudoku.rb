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





end

 def string_breaker

    sudoku_string = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
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



    p sudoku_board
    # this is now an array with 9 array inside (the rows)

end

string_breaker

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
