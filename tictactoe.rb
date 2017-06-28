class Cell

  def initialize
    @value = nil
  end

  def value
    return " " if @value == nil
    @value
  end

  def set(player)
    unless value == " "
      puts "Error, that square is already taken!"
      return false
    end
    @value = player.symbol
  end

end

class Player

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  attr_reader :symbol
  attr_reader :name

end

class Game

  def initialize
    @players = set_player
    @game_over = false
  end

  attr_reader :players
  attr_reader :cells
  attr_accessor :game_over

  def board
    horizontals = "---+---+---"
    puts " #{cells[1].value} | #{cells[2].value} | #{cells[3].value} "
    puts horizontals
    puts " #{cells[4].value} | #{cells[5].value} | #{cells[6].value} "
    puts horizontals
    puts " #{cells[7].value} | #{cells[8].value} | #{cells[9].value} "
  end

  def move(player)
    puts "Please enter a number 1 through 9"
    board
    puts "Which of the nine spaces would you like to occupy? (enter a number 1-9)"
    player_input = gets.chomp.to_i
    if not player_input.between?(1,9)
      puts "Error, no number detected!"
      again = true
    else
      again = true if not cells[player_input].set(player)
    end
    move(player) if again
    draw_check if win_check(player) == false
  end

  def win_check(player)
    winners = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[3,5,7],[1,5,9]]
    winners.each do |a,b,c|
      if ( cells[a].value == player.symbol && cells[b].value == player.symbol && cells[c].value == player.symbol )
        return end_win(player)
      end
    end
    return false
  end

  def draw_check
    squares = (1..9).map { |i| cells[i].value }
    end_draw() if squares.none? { |i| i == " " }
  end

  def end_win(player)
    puts
    board
    puts "The winner is #{player.name}!"
    self.game_over = true
  end

  def end_draw
    puts
    board
    puts "It's a draw!"
    self.game_over = true
  end

  def set_player
    player_array = []

    puts "What is the name of player one?"
    p1name = gets.chomp.to_s
    p1sym = "X"
    player_array << Player.new(p1name, p1sym)

    puts "What is the name of player two?"
    p2name = gets.chomp.to_s
    p2sym = "O"
    player_array << Player.new(p2name, p2sym)
    return player_array
  end

  def play_again(players)
    puts "New Game? (Y/N)"
    response = gets.chomp.to_s.upcase[0]
    case response
    when "Y"
      begin_game
    when "N"
      puts "Thanks for playing!"
      return
    else
      puts "Error, please enter characters Y or N."
      again = true
    end
    play_again(players) if again == true
  end

  def begin_game
    i = 0
    self.game_over = false
    @cells = {}
    (1..9).each { |i| @cells[i] = Cell.new }
    while self.game_over == false
      move(players[i % 2])
      i += 1
    end
    play_again(players)
  end
end


game = Game.new
game.begin_game()
