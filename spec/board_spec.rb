require './lib/ship'
require './lib/cell'
require './lib/board'

describe Board do
    it "exists" do
        board = Board.new

        expect(board).to be_a(Board)
        expect(board.cells).to be_a(Hash)
    end

    it "has valid coordinates" do
        board = Board.new

        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
    end


    it "has overlapping coordinates" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2) 

        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'has consecutive coordinates' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2) 
        
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it 'has diagonal coordinates' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2) 
        
        expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
        expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it 'has valid placement' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2) 
        
        expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
        expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end

    it 'places ship' do
    board.place(cruiser, ["A1", "A2", "A3"])    
    cell_1 = board.cells["A1"] 
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]    
    cell_1.ship = Cruiser
    cell_2.ship = Crusier
    cell_3.ship = Cruiser
    expect(cell_3.ship == cell_2.ship).to eq(true)
    end
end
