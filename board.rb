class Board
  attr_accessor :board

  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
  end

  def empty_display
    " #{@board[0]} | #{@board[1]} | #{@board[2]}\n" \
    "---+---+---\n" \
    " #{@board[3]} | #{@board[4]} | #{@board[5]}\n" \
    "---+---+---\n" \
    " #{@board[6]} | #{@board[7]} | #{@board[8]}\n" \
  end

  def move (spot, piece)
    @piece = piece
    @board[spot] = empty_spot?(spot) ? @piece : occupied
  end

  def occupied
    puts "That spot is taken, try again/n>"
    n = new_choice
    move(n, @piece)
  end

  def choose_spot
    gets.chomp.to_i
  end
end
