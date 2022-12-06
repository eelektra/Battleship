require './lib/ship'

describe Ship do
    it 'exists' do
        cruiser = Ship.new("Cruiser", 3)
        
        expect(cruiser.name).to be_a("Cruiser")
        expect(cruiser.length).to eq(3)
    end


end