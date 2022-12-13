require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

describe Game do

    it "has valid computer coordinates" do
        game = Game.new
        
        expect(game.computer_valid_coordinates(game.computer_cruiser).length).to eq(3)
    end

    it "places computer ship" do
        game = Game.new

        game.computer_place_ship
        expect(computer_board).to eq()
    end
end