class Cell
    attr_reader :coordinate, 
                :ship
    
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

    # def fire_upon
    #     @fired_upon = true
    #     ship.hit if ship != nil
    # end
    def fire_upon
        if @ship != nil
          @ship.hit
          @fired_upon = true
         end
        @fired_upon = true
    end
    
    def strike_miss
        fired_upon? && empty?
    end
    
    def ship_destroyed
        fired_upon? && @ship.sunk?
    end
    
    def ship_damage
        fired_upon? && !empty?
    end

    def render(show = false)
        if @fired_upon == true && @ship != nil && @ship.sunk? == true
            "X"
        elsif @fired_upon == true && @ship != nil
            "H" 
        elsif @fired_upon == true && @ship == nil
            "M"
        elsif @fired_upon == false && @ship != nil && show == true 
            "S" 
        elsif @fired_upon == false
            "."
        end
    end
end