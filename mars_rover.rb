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
    @bound_x = options[ :bound_x ] || 100 #I'm defaulting 100 cuz I want something in boundary
    @bound_y = options[ :bound_y ] || 100 #I'm defaulting 100 cuz I want something in boundary

  end

  def set_location( in_x, in_y, in_direct )

    @coord_x = in_x
    @coord_y = in_y
    @direction = in_direct

  end

  def set_plateau( inbound_x, inbound_y )

    @bound_x = inbound_x
    @bound_y = inbound_y

  end

  def show_location

    puts "Name:  #{ @name }"
    puts "x coordinate:  #{ @coord_x }"
    puts "y coordinate:  #{ @coord_y }"
    puts "direction:  #{ @direction }"
    puts "x boundary:  #{ @bound_x }"
    puts "y boundary:  #{ @bound_y }"

  end

   def move( incoming_instructions )

    #Needed a way to keep track of direction when rotated.  R = +1, L = -1.
    #Put a condition to go back to index 0 if > 3 (W => N).
    direct_grid = [ "N", "E", "S", "W" ]

    #Split movements if placed as group
     instructions = incoming_instructions.split( // )

     instructions.each { | movement |

      case movement

        when "L"
          @direction = direct_grid[ ( direct_grid.index( @direction.to_s ) - 1 ) ]

        when "R"
          #If my directions go from west to north ( array > array length ) make north because pointer will pass end of array
          if ( ( direct_grid.index( @direction.to_s ).to_i + 1 ) > direct_grid.length )
            @direction = "N"

          else
            @direction = direct_grid[ ( direct_grid.index( @direction.to_s ).to_i + 1 ) ]

        end

        when "M"
          #Figure out where the movement is and make the new coordinates in a temporary variable
          if @direction == "N"
              #Get coordinates and make move
              @temp_coord_y = @coord_y + 1 #Make move
              @temp_coord_x = @coord_x

            elsif @direction == "E"
              #Get coordinates and make move
              @temp_coord_y = @coord_y
              @temp_coord_x = @coord_x + 1 #Make move

            elsif @direction == "S"
              #Get coordinates and make move
              @temp_coord_y = @coord_y - 1 #Make move
              @temp_coord_x = @coord_x

            elsif @direction == "W"
              #Get coordinates and make move
              @temp_coord_y = @coord_y
              @temp_coord_x = @coord_x - 1 #Make move

          end

          #Commit my coordinates if my location doesn't pass the boundaries
          if @temp_coord_x.to_i.between?( 0, @bound_x.to_i ) && @temp_coord_y.to_i.between?( 0, @bound_y.to_i )
              @coord_x = @temp_coord_x
              @coord_y = @temp_coord_y

            else
              puts "Instruction will put rover out of bounds"

          end

        else puts "Invalid command"

      end

      #Keeping in case I need to debug and see what is going on with my coordinates
      #  self.show_location

     }

   end

end

class Mission_control

  attr_accessor :name, :bound_x, :bound_y, :chess_piece, :current_piece

  def initialize( incoming_name, incoming_piece, options = {} )

      @name = incoming_name
      @bound_x = options[ :bound_x ] || 100 #I'm defaulting 100 cuz I want something in boundary
      @bound_y = options[ :bound_y ] || 100 #I'm defaulting 100 cuz I want something in boundary
      @chess_piece = [ incoming_piece ]
      @current_piece = 0

  end

  def add_chess_piece( add_piece )

    @chess_piece << add_piece

  end

  def count_pieces

    puts "Number of pieces to control:  #{ @chess_piece.length }"

  end

  def set_plateau( inbound_x, inbound_y )

    @bound_x = inbound_x
    @bound_y = inbound_y

  end

  def status

    chess_piece.each { | piece |

      piece.show_location

    }

  end

  def change_current( incoming_name )

    #Get index where key name, haven't put any trapping if name isn't found
    @current_piece = chess_piece.find_index{ | s | s.name == incoming_name }
    puts "Current piece is:  #{ chess_piece[ current_piece.to_i ].name }"

  end

  def see_current

    puts "Current piece is:  #{ chess_piece[ current_piece.to_i ].name }"

  end

  def move_current( instruction )

    #I'm sending the whole instruction to the rover.  I haven't completed any collision detection.
    chess_piece[ current_piece ].move( instruction.to_s )

  end

end

#main

#Instantiate objects
mars1 = Rover.new( "mars1", { :coord_x => 1, :coord_y => 2, :direction => "N", :bound_x => 5, :bound_y => 5 } )
mars2 = Rover.new( "mars2", { :coord_x => 3, :coord_y => 3, :direction => "E", :bound_x => 5, :bound_y => 5 } )
houston = Mission_control.new( "Houston", mars1 )

#Give commands
houston.count_pieces
houston.add_chess_piece( mars2 )
houston.count_pieces
houston.set_plateau( 5, 5 )
houston.status
houston.change_current( "mars1" )
houston.move_current( "LMLMLMLMM" )
houston.change_current( "mars2" )
houston.move_current( "MMRMMRMRRM" )
houston.status #At least I'm getting the rovers to move to where they are supposed to go.



#Stuff below was to check my rover class

# #initialize Mars1
# mars1 = Rover.new( "Mars1", { :coord_x => 1, :coord_y => 2, :direction => "N", :bound_x => 5, :bound_y => 5} )
# #show initial location
# mars1.show_location
# #move my rover via instructions provided
# mars1.move( "LMLMLMLMM" )
# #show final location
# mars1.show_location
#
# #initialize Mars2
# mars2 = Rover.new( "Mars2" )
# #try the other method of setting up initial location
# mars2.set_location( 3, 3, "E" )
# #display initial location
# mars2.show_location
# #move my rover via instructions provided
# mars2.move( "MMRMMRMRRM" )
# #show final location
# mars2.set_plateau(5, 5) #testing method
# mars2.show_location
# mars2.move("!") #testing invalid command (error trapping)
