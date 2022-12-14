require './lib/cell'
require './lib/ship'
require './lib/board'

class Game
  attr_reader :computer_board, 
              :computer_cruiser, 
              :computer_submarine

  def initialize
      @computer_board = Board.new
      @player_board = Board.new
      @computer_cruiser = Ship.new("Cruiser", 3)
      @computer_submarine = Ship.new("Submarine", 2)
      @player_cruiser = Ship.new("Cruiser", 3)
      @player_submarine = Ship.new("Submarine", 2)
      @computer_input = nil
      @player_input = nil
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
      p "Try again"
      start
    end
  end

  def computer_valid_coordinates(ship)
    coordinates = []
    until @computer_board.valid_placement?(ship, coordinates)   
      coordinates = @computer_board.cells.keys.sample(ship.length)
    end
    coordinates
  end

  def computer_place_ship
    ships = [@computer_cruiser, @computer_submarine]
      ships.each do |ship|
        coordinates = computer_valid_coordinates(ship)
        @computer_board.place(ship, coordinates)
      end

    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
  end

  def player_place_cruiser
    p "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render(true)
    p "Enter the squares for the Cruiser (3 spaces):"

    user_input = gets.chomp.upcase.delete(",").split
    if @player_board.valid_placement?(@player_cruiser, user_input) == true
      @player_board.place(@player_cruiser, user_input)
    else @player_board.valid_placement?(@player_cruiser, user_input) == false
      p "Those are invalid coordinates. Please try again:"
      player_place_cruiser
    end
  end

  def player_place_submarine
    puts @player_board.render(true)
    p "Enter the squares for the Submarine (2 spaces):"

    user_input = gets.chomp.upcase.delete(",").split
    if @player_board.valid_placement?(@player_submarine, user_input) == true
      @player_board.place(@player_submarine, user_input)
    else @player_board.valid_placement?(@player_submarine, user_input) == false
      p "Those are invalid coordinates. Please try again:"
      player_place_submarine
    end
  end

  def turn
    p "=============COMPUTER BOARD============="
    puts @computer_board.render
    p "==============PLAYER BOARD=============="
    puts @player_board.render(true)
  end

  def player_shot
    p "Enter the coordinate for your shot:"
    
    loop do
      user_shot = gets.chomp.upcase
      if @computer_board.valid_coordinate?(user_shot) == true
        @computer_board.cells[user_shot].fire_upon
        @player_input = user_shot
        break
      elsif @computer_board.valid_coordinate?(user_shot) == false
        p "Please enter a valid coordinate:"
      end
    end
  end

  def computer_shot
    coordinate = @player_board.cells.keys.sample
    until @player_board.cells[coordinate].fired_upon? == false
      coordinate = @player_board.cells.keys.sample
    end
    @player_board.cells[coordinate].fire_upon
    @computer_input = coordinate
  end

  def player_results
    if @player_board.cells[@computer_input].render == "X"
      p "My shot on #{@computer_input} sunk your ship."
    elsif @player_board.cells[@computer_input].render == "H"
      p "My shot on #{@computer_input} was a hit."
    elsif @player_board.cells[@computer_input].render == "M"
      p "My shot on #{@computer_input} was a miss."
    end
  end

  def computer_results
    if @computer_board.cells[@player_input].render == "X"
      p "Your shot on #{@player_input} sunk my ship."
    elsif @computer_board.cells[@player_input].render == "H"
      p "Your shot on #{@player_input} was a hit."
    elsif @computer_board.cells[@player_input].render == "M"
      p "Your shot on #{@player_input} was a miss."
    end
  end

  def player_wins
    @computer_cruiser.sunk? == true && @computer_submarine.sunk? == true
  end

  def computer_wins
    @player_cruiser.sunk? == true && @player_submarine.sunk? == true
  end

  def play_game
    computer_place_ship
    player_place_cruiser
    player_place_submarine

    until player_wins || computer_wins
      turn 
      player_shot
      computer_shot
      player_results
      computer_results
    end

    if player_wins
      p "You won!"
    else computer_wins
      p "I won!"
    end
    p "GAME OVER"
    start
  end

  def quit_game
     p "See you next time!"
  end
end