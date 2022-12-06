require './lib/ship'
require './lib/cell'

describe Cell do
    it "exists" do
        cell = Cell.new("B4")

        expect(cell).to be_a(Cell)

    it "is empty?" do
        cell = Cell.new("B4")

        expect(cell.coordinate).to eq("B4")
        expect(cell.ship).to eq(nil)
        cell.empty?.to eq(true)
    end
end