INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [['X', 'X', ' '], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

WINNING_LINES.each do |line|
  if line.count("X") == 2
    puts line.inspect
    line.each do |space|
      if space == ' '
        space = COMPUTER_MARKER
        puts line.inspect
      end
    end
  end
end

puts WINNING_LINES.inspect
