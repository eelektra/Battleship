class Cell
    attr_reader :coordinate, :ship
    
    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
    end

    def empty?
       ship == nil
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon?
       @fired_upon
    end

    def fire_upon
        @fired_upon = true
        ship.hit if ship != nil
    end

    def render()
        if @fired_upon == false
            "."
        elsif @fired_upon == true && ship == nil
             "M"
        elsif @fired_upon == false && ship != nil
            "S" 
        elsif @fired_upon == true && ship != nil
            "H" 
        elsif @fired_upon == true && ship.sunk? == true
            "X"
        end
    end
end