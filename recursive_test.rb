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


# def recursive_guess(partially_solved_board)
#   #do the basic to narrow down
#   solved_board = partially_solved_board.each_with_index do |row, row_idx|
#     row.each_with_index do |square, col_idx|
#       if square.is_a?(Array) && !square.empty?
#         possible_solutions = solve_suite(row, square, row_idx, col_idx, partially_solved_board)
#         if possible_solutions.empty?
#           recursive_guess(partially_solved_board)
#         else
#           possible_solutions.each do |potential_num|
#             # make the square equal to the possible
#             row[col_idx] = potential_num


#             # binding.pry
#             test_board = recursive_guess(partially_solved_board)
#             if test_board.flatten.length == 81
#               p test_board
#               break
#             end
#             # else
#             #   square = possible_solutions
#             # end
#           end
#       # elsif square.is_a?(Array) && square.empty?
#       #   return false
#       end
#     end
#   end
#   solved_board
# end


# def guess_checker(sudoku_board)
#   sudoku_board.each_with_index do |row, row_index|
#     row.each_with_index do |box, box_index |
#       p box
#       box.map.with_index do |item, item_index|
#         if item.is_a?(Array)
#           item.each_with_index do |possibility, pos_index|
#             box = possibility
#             solve(sudoku_board)
#             guess_checker(sudoku_board)
#           end
#         else
#           item.each_with_index do |possibility, pos_index|
#             box = possibility[pos_index+1]
#             solve(sudoku_board)
#           end
#         end
#       end
#     end
#   end
# end

# def recursive_guess(partially_solved_board)
#   hypothetical_board = partially_solved_board.dup
#   solved_board = partially_solved_board.map.with_index do |row, row_idx|
#     row.map.with_index do |square, col_idx|
#       if square.is_a?(Array)
#         square = solve_suite(row, square, row_idx, col_idx, partially_solved_board)
#         # next if square.empty?
#           # return nil
#           square.each do |possible_solution|
#             if !square.empty?
#             hypothetical_board[row_idx][col_idx] = possible_solution
#             p hypothetical_board
#             until hypothetical_board.flatten.length == 81
#               recursive_guess(partially_solved_board)
#               if !solved?(partially_solved_board)
#                 recursive_guess(partially_solved_board)
#               end
#             end
#           end
#         end
#         end

#       #   square.each do |possible_solution|
#       #     hypothetical_board[row_idx][col_idx] = possible_solution
#       #     p hypothetical_board
#       #     until hypothetical_board.flatten.length == 81
#       #       recursive_guess(partially_solved_board)
#       #       if !solved?(partially_solved_board)
#       #         recursive_guess(partially_solved_board)
#       #       end
#       #     end
#       #   end
#       # end
#     end
#   end
#   solved_board
# end




# def recursive_guess(partially_solved_board)
#   hypothetical_board = partially_solved_board.dup
#   solved_board = partially_solved_board.map.with_index do |row, row_idx|
#     row.map.with_index do |square, col_idx|
#       if square.is_a?(Array)
#         square = solve_suite(row, square, row_idx, col_idx, partially_solved_board)
#             square.each do |possible_solution|
#               hypothetical_board[row_idx][col_idx] = possible_solution
#               recursive_guess(hypothetical_board)
#             end
#           end
#         end
#       end
#       solved_board
# end

# puts recursive_guess(string_breaker("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"))




# board_string = "3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-"



def recursive_guess(partially_solved_board)
  return nil if partially_solved_board == nil

  until solved?(partially_solved_board)
  partially_solved_board.each_with_index do |row, row_idx|
    row.each_with_index do |square, col_idx|
      if square.is_a?(Array)
        square = solve_suite(row, square, row_idx, col_idx, partially_solved_board)
        if square.empty?
          return nil
        end
        square.each do |potential_solution|
          potential_board = partially_solved_board
          potential_board[row_idx][col_idx] = potential_solution
          if recursive_guess(potential_board) != nil
            p potential_board
            return potential_board
          else
            return nil
          end
        end
        end
      end
    end
  end

  partially_solved_board
end












def solve_complete(board_string)
  partially_solved_board = solve(board_string)
  # p partially_solved_board
  p recursive_guess(partially_solved_board)
  # p partially_solved_board
end




p solve_complete("3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-")
# p solve_complete("3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-")
