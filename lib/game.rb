require './lib/cell'
require './lib/ship'
require './lib/board'

class Game
  def initialize
    @computer = 
    @player = 
  end

  def start
      p "Welcome to BATTLESHIP"
      p "Enter p to play. Enter q to quit."
  
      user_input = gets.chomp.downcase
      if user_input == "p"
        play_game
      elsif user_input == "q"    
        quit_game
      else 
        "Try again"
      end
  end

  def play_game
    # Once the User has chosen to play, you need to place the computer’s ships and the players ships to set up the game.

    #place_ship method for computer: use random placements but still adhere to the valid placement rules from iteration 2

    # & player: place_ship method & player_placement_message
  end

  def quit_game
     p "See you next time!"
  end

  def cpu_placement
    
  end

  def empty_board
    p "I have laid out my ships on the grid.
      You now need to lay out your two ships.
      The Cruiser is three units long and the Submarine is two units long.
      1 2 3 4
    A . . . .
    B . . . .
    C . . . .
    D . . . .
    Enter the squares for the Cruiser (3 spaces):
    >"
  end

  def valid_sequence
    "Enter the squares for the Cruiser (3 spaces):
    > A1 A2 A3

      1 2 3 4
    A S S S .
    B . . . .
    C . . . .
    D . . . .
    Enter the squares for the Submarine (2 spaces):
    >"
  end

  def invalid_sequence
    "Enter the squares for the Submarine (2 spaces):
    > C1 C3
    Those are invalid coordinates. Please try again:
    > A1 B1
    Those are invalid coordinates. Please try again:
    > C1 D1"
  end

  
end