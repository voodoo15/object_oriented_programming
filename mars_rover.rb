#Exercise 2
#Name:  Arnold Redoblado
#Date:  2016-03-24
#Purpose:  Create a Mars rover and be able to move it around a grid with directions

class Rover
  attr_accessor :name, :coord_x, :coord_y, :direction, :bound_x, :bound_y

  def initialize( in_name, options = {} )

    @name = in_name
    @coord_x = options[ :coord_x ]
    @coord_y = options[ :coord_y ]
    @direction = options[ :direction ]
    @bound_x = options[ :bound_x ]
    @bound_y = options [ :bound_y ]

  end

  def set_location( in_x, in_y, in_direct )

    @coord_x = in_x
    @coord_y = in_y
    @direction = in_direct

  end

  def set_map( inbound_x, inbound_y )

    @bound_x = inbound_x
    @bound_y = inbound_y

  end

  def show_location

    puts "Name:  #{ @name }"
    puts "x coordinate:  #{ @coord_x }"
    puts "y coordinate:  #{ @coord_y }"
    puts "direction:  #{ @direction }"

  end

   def move( incoming_instructions )

    direct_grid = [ "N", "E", "S", "W" ]

     instructions = incoming_instructions.split( // )

     instructions.each { | movement |

      case movement

        when "L"
          @direction = direct_grid[ ( direct_grid.index( @direction.to_s ) - 1 ) ]

        when "R"

          #If my directions go from west to north > 3 use option one because it will pass end of array
          if ( direct_grid.index( @direction.to_s ) + 1 ) > 3

            @direction = "N"

          else

            @direction = direct_grid[ ( direct_grid.index( @direction.to_s ) + 1 ) ]

        end

        when "M"

          if @direction == "N"
              @coord_y += 1
            elsif @direction == "E"
              @coord_x += 1
            elsif @direction == "S"
              @coord_y -= 1
            elsif @direction == "W"
              @coord_x -= 1
          end

      end

     }

   end

end

# mars1 = Rover.new( "Mars1", { :coord_x => 1, :coord_y => 2, :direction => "N" } )
# mars1.move( "LMLMLMLMM" )
# mars1.show_location


mars2 = Rover.new( "Mars2" )
mars2.set_location( 3, 3, "E" )
mars2.show_location
mars2.move( "MMRMMRMRRM" )
mars2.show_location
