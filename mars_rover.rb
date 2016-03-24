#Exercise 2
#Name:  Arnold Redoblado
#Date:  2016-03-24
#Purpose:  Create a Mars rover and be able to move it around a 10x10 grid with directions

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

    puts "x coordinate:  #{ @coord_x }"
    puts "y coordinate:  #{ @coord_y }"
    puts "direction:  #{ @direction }"

  end

end

mars1 = Rover.new( "Mars1", { :coord_x => 1, :coord_y => 2, :direction => "N" } )
mars1.show_location
mars2 = Rover.new( "Mars2")
mars2.set_location( 3, 3, "E" )
