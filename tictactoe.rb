=begin
Implementation of a tic-tac-toe game on the command line
where two human players can play against each other and
the board is displayed between turns.
=end

class O

class X

def begin_game
  print "Hello, welcome to TicTacToe!"
  empty_display method here
  askwhichsquare method here

def askwhichsquare
  print "Which of the 9 spaces would you like to occupy? (enter a number 1-9)"
  user_input = gets.chomp
  if number 1-9 case statement
    case 1
      print class + board
    case 2
    case 3
    case 4
    case 5
    case 6
    case 7
    case 8
    case 9
  elsif user_input is not 1-9
    print "error, please enter a number between 1 and 9..."
    user_input = gets.chomp
    go back to case statement
  (move method here)
  (checkwin method here)

def empty_display
  display the empty board

def update_display
  store user_input onto board

def checkwin
  if 3 in a row or diagonal
    123
    456
    789
    147
    258
    369
    159
    357
    print "#{class} wins!"
    reset
  elsif
    the board 1-9 is full
    reset
  else
    display method here

def reset
  erase game and start over

def move
  check if occupied, cant move there
  if not occupied, occupy space, update_display
    print update_display
  when done, switch class(from O to X, vice versa)
