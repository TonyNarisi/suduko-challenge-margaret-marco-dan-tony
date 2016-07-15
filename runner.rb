require_relative 'sudoku'
require 'pry'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 18 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

# board_string = File.readlines('sudoku_puzzles.txt').first.chomp
string_board = "29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9"
solved_board = solve(string_board)
p solved_board
if solved?(solved_board)
  puts "The board was solved!"
  p pretty_board(solved_board)
else
  puts "The board wasn't solved :("
end




# string_board = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"

# p solve(string_board)

# string_board2 = "29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9"

# p solve(string_board2)
