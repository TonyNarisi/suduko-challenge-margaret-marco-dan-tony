require_relative 'sudoku'
require 'pry'

# SUDOKODE

# Recursive Guess Method
# BASE CASE = Entire board is filled out, return true
# - We iterate through the sudoku board
#   - The first element that is an array that we hit, we iterate through the possibilities in the array
#     - We fill in a hypothetical board with that potential solution in that element's space
#     - We then run the Recursive Guess Method again, which now starts at the next element that is an array of possibilities
#       - If the Recursive Guess Method hits an empty array, it returns false


def recursive_guess(partially_solved_board)
  partially_solved_board.each_with_index do |row, row_idx|
    row.each_with_index do |square, col_idx|
      if square.is_a?(Array) && !square.empty?
        square = solve_suite(row, square, row_idx, col_idx, partially_solved_board)
        possible_solutions = square
        possible_solutions.each do |potential_num|
          square = potential_num
          if recursive_guess(partially_solved_board)
            return true
          else
            square = possible_solutions
          end
        end
      elsif square.is_a?(Array) && square.empty?
        return false
      end
    end
  end
  true
end

def solve_complete(board_string)
  partially_solved_board = solve(board_string)
  recursive_guess(partially_solved_board)
end

p solve_complete("3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-")
