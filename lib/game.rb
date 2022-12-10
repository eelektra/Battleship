require './lib/cell'
require './lib/ship'
require './lib/board'

class Game
 
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
    #something
  end

  def quit_game
     p "See you next time!"
  end

  def cpu_placement
    
  end

  def player_placement
   p "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long.
    1 2 3 4
   A . . . .
   B . . . .
   C . . . .
   D . . . .
   Enter the squares for the Cruiser (3 spaces):"
  end


end