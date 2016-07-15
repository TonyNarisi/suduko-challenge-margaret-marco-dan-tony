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
