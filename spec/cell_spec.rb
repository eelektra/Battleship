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
        
        expect(cell.ship.name).to eq("Cruiser")
        expect(cell.empty?).to eq(false)
    end

    it "fired Upon?" do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)

        cell.place_ship(cruiser)
        
        expect(cell.fired_upon?).to eq(false)

        cell.fire_upon

        expect(cell.ship.health).to eq(2)
        expect(cell.fired_upon?).to eq(true)
    end

    it "can render a cell" do
        cell_1 = Cell.new("B4")

        expect(cell_1.render).to eq(".")
        cell_1.fire_upon
        expect(cell_1.render).to eq("M")
    end

    it "can render another cell" do
        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)
        cell_2.place_ship(cruiser)
        expect(cell_2.render).to eq(".")
        expect(cell_2.render(true)).to eq("S")
        cell_2.fire_upon
        expect(cruiser.sunk?).to eq(false)
        cruiser.hit
        cruiser.hit
        expect(cruiser.sunk?).to eq(true)
        expect(cell_2.render).to eq("X")
    end
end