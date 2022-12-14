require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

class Game
  
  attr_reader   :player_board,
                :mac_board,
                :player_ships,
                :mac_cruiser,
                :mac_sub,
                :mac_ships,
                :message
    
  
  def initialize
    @player_board   = Board.new
    @mac_board      = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub     = Ship.new("Submarine", 2)
    @mac_cruiser    = Ship.new("Cruiser", 3)
    @mac_sub        = Ship.new("Submarine", 2)
  end

  
  def start
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
  
    user_input = gets.chomp.downcase
      if user_input == "p"
         place_mac_ships
         puts "I have laid out my two ships on the board." 
         puts "You now need to lay out your two ships.\nThe Cruiser is three coordinates long.\nThe Submarine is two coordinates long."
         puts "Enter three coordinates for your Cruiser (for example, b1 b2 b3):"
         place_player_cruiser
         puts "Enter two coordinates for your Submarine"
         place_player_sub
         turn
      elsif user_input == "q" 
        "See you next time!"
        exit
      else 
        "Try again"
      end
  end

  def get_mac_ship_coordinates(ship)
    @mac_board.cells.keys.sample(ship.length)
  end

  def validate_mac_ship_coordinates(ship)
    random_coordinates = []
      until @mac_board.valid_placement?(ship, random_coordinates) do
        random_coordinates = get_mac_ship_coordinates(ship)
      end
        random_coordinates
  end

  def place_mac_ships
    get_mac_ship_coordinates(@mac_cruiser)
    @mac_board.place(@mac_cruiser, get_mac_ship_coordinates(@mac_cruiser))
    get_mac_ship_coordinates(@mac_sub)
    @mac_board.place(@mac_sub, get_mac_ship_coordinates(@mac_sub))
    #require 'pry';binding.pry
  end

  def place_player_cruiser
    puts @player_board.render(true)
    user_prompt = gets.chomp.upcase.split(" ")
    if @player_board.valid_placement?(@player_cruiser, user_prompt)
      @player_board.place(@player_cruiser, user_prompt)
    else
      puts "Those are invalid coordinates. Please try again:"
      place_player_cruiser
    end
  end

  def place_player_sub
    puts @player_board.render(true)
    user_prompt = gets.chomp.upcase.split(" ")
    if @player_board.valid_placement?(@player_sub, user_prompt)
      @player_board.place(@player_sub, user_prompt)
      puts @player_board.render(true)
    else
      puts "Those are invalid coordinates. Please try again:"
      place_player_sub
    end
  end

  def turn
    puts "========= Computer Board ========="
    puts @mac_board.render(true)
    puts "========= Player Board ========="
    puts @player_board.render(true)
    puts "Enter the coordinate for your strike."
    get_player_strike_coordinate
    player_wins
    mac_strike
    mac_wins
    turn
  end

  def get_player_strike_coordinate
    player_strike = gets.chomp.upcase
      if @mac_board.valid_coordinate?(player_strike.strip) == true
        print_player_strike_outcomes(player_strike)
      else
        puts "That is an invalid strike coordinate. Try Again:"
        get_player_strike_coordinate
      end
  end

  def print_player_strike_outcomes(player_strike)
    @mac_board.cells[player_strike].fire_upon
      if @mac_board.cells[player_strike].strike_miss
      "M"
      puts "Your strike on #{player_strike} missed!"
      elsif @mac_board.cells[strike].ship_destroyed
      "X"
      puts "Your strike on #{player_strike} sunk my ship!"
      elsif @mac_board.cells[strike].ship_damage
      "H"
      puts "Your strike on #{player_strike} was a direct hit!"
      else
       "."
      end
  end

  def mac_strike
    mac_strike = @player_board.cells.keys.sample(1).join
    if @player_board.valid_coordinate?(mac_strike) == true
      mac_strike_outcomes(mac_strike)
    else
      mac_strike
    end
  end

  def mac_strike_outcomes(mac_strike)
    @player_board.cells[mac_strike].fire_upon
      if @player_board.cells[mac_strike].strike_miss
        "M"
        puts "My shot on #{mac_strike} was a miss."
      elsif @player_board.cells[mac_strike].ship_destroyed
        "X"
        puts "My shot on #{mac_strike} has destroyed your ship."
      elsif @player_board.cells[mac_strike].ship_damage
        "H"
        puts "My shot on #{mac_strike} was a hit."
      else
       "."
      end
  end

  def player_wins
    if @mac_cruiser.sunk? && @mac_sub.sunk?
      puts "You have won the game!"
      initialize
      start
    end
  end

  def mac_wins
    if @player_cruiser.sunk?  && @player_sub.sunk?
      puts "You have lost the game."
      #initialize
      start
    end
  end
end