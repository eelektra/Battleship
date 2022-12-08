class Board
    attr_reader :board, :cells
    def initialize
        @cells = {
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4"),
        }
    end

    def valid_coordinate?(coordinate)
        @cells[coordinate] != nil
    end

    def valid_placement?(ship, coordinates)
        require 'pry'; binding.pry
        (ship && coordinates) == (ship && coordinates) 
        false
    end

    def consecutive_coordinates?(ship, coordinates)
       #board letters are horizontal, numbers are vertical

        #coordinate != index
       #.split will split a string into separate
       #gsub substitutes all of one letter for another letter

        # all the letters are consecutive
        # coordinates.each_cons(A)

        # all numbers are the same 
        numbers_array
        numbers_array.each_cons(2).all? do |num_1,num_2| 
            num_1.split == num_2.split
        end
        # all the numbers are consecutive
        # coordinates.each_cons(1..4)

        # letters are the same
        letters_array
        letters_array.each_cons(2).all? do |num_1,num_2| 
            ltr_1 == ltr_2
        end
               

         
            
        
    end
             
    def 
        
        end
    end
end