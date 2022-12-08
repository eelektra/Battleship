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
        letters_array = all_letters(coordinates) 
        numbers_array = all_numbers(coordinates)
        valid_consecutive_numbers(numbers_array) && valid_consecutive_letters(letters_array)
        # require 'pry'; binding.pry
    end
    
    def consecutive_valid_placement?(ship, coordinates)
        all_letters
    end

    def all_letters(coordinates)
        coordinates.map do |coordinate| 
            coordinate.split('').first 
        end
    end
    
    def valid_consecutive_letters(letters_array)
        letters_array.each_cons(2).all? do |letter_1, letter_2| 
            letter_2.ord - 1 == letter_1.ord 
        end
    end

    def all_numbers(coordinates)
        coordinates.map do|coordinate| 
            coordinate.split('').last 
        end
    end

    def valid_consecutive_numbers(numbers_array)
        numbers_array.each_cons(2).all? do |num_1, num_2| 
            num_2.to_i - 1 == num_1.to_i 
        end
    end
end

#diagonal coordinates
#

#consecutive coordinates
# all the letters are the same
# the letters are consecutive
# all the numbers are the same
# the numbers are consective