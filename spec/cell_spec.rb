require './lib/ship'
require './lib/cell'

describe Cell do
    it "exists" do
        cell = Cell.new("B4")

        expect(cell).to be_a(Cell)
    end

    it "is the cell empty?" do
        cell = Cell.new("B4")

        expect(cell.coordinate).to eq("B4")
        expect(cell.ship).to eq(nil)
        expect(cell.empty?).to eq(true)
    end

    it "place_ship" do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)

        cell.place_ship(cruiser)
        
        expect(cell.ship).to eq("Cruiser")
        expect(cell.empty?).to eq(false)
    end
end