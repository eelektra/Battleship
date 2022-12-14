require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

describe Game do
    let(:game) { Game.new }

    it "has valid computer coordinates" do
        expect(game.computer_valid_coordinates(game.computer_cruiser).length).to eq(3)
        expect(game.computer_valid_coordinates(game.computer_submarine).length).to eq(2)
    end
end

