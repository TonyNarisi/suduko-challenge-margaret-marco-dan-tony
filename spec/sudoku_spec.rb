require_relative '../sudoku'

describe "Sudoku" do
  let(:sudoku_board) { [
      [1,[1,2,3,4,5,6,7,8,9],5,8,[1,2,3,4,5,6,7,8,9],2,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9]],
      [[1,2,3,4,5,6,7,8,9],9,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],7,6,4,[1,2,3,4,5,6,7,8,9],5],
      [2,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],4,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],8,1,9],
      [[1,2,3,4,5,6,7,8,9],1,9,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],7,3,[1,2,3,4,5,6,7,8,9],6],
      [7,6,2,[1,2,3,4,5,6,7,8,9],8,3,[1,2,3,4,5,6,7,8,9],9,[1,2,3,4,5,6,7,8,9]],
      [[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],6,1,[1,2,3,4,5,6,7,8,9],5,[1,2,3,4,5,6,7,8,9]],
      [[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],7,6,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],3,[1,2,3,4,5,6,7,8,9]],
      [4,3,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],2,[1,2,3,4,5,6,7,8,9],5,[1,2,3,4,5,6,7,8,9],1],
      [6,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],3,[1,2,3,4,5,6,7,8,9],8,9,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9]]
       ] }

  context 'it breaks a sudoku_string into an array of arrays for manipulation' do
    it 'correctly converts a sudoku_string' do
      expect(string_breaker("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")).to eq sudoku_board
    end
  end

  context 'it removes the numbers from possible solutions of box' do

      let(:box_one) {[
                    [1,[1,2,3,4,5,6,7,8,9],5],
                    [[1,2,3,4,5,6,7,8,9],9,[1,2,3,4,5,6,7,8,9]],
                    [2,[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9]]
                      ] }

    it 'removes the possible solutions if they are found in the row' do
      expect(row_checker(sudoku_board[0][1], 0)).to match_array [3,4,6,7,9]
    end

    it 'removes the possible solutions if they are found in the column' do
      expect(column_checker(sudoku_board[1][0], 0)).to match_array [3,5,8,9]
    end

    it 'removes the possible solutions if they are in the three by three grid' do
      expect(box_checker(sudoku_board[0][1], box_one)).to match_array [3,4,6,7,8]
    end

    it 'checks for unique possible solutions within three by three grid' do
    end

  end

end
