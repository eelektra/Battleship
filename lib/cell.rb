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

    def render(show = false)
        if @fired_upon == false && ship != nil && show == true 
            "S" 
        elsif @fired_upon == true && ship == nil
            "M"
        elsif @fired_upon == true && ship.sunk? == true
            "X"
        elsif @fired_upon == true && ship != nil
            "H" 
        elsif @fired_upon == false
            "."
        end
    end
end