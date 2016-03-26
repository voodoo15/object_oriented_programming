#Exercise 3
#Name:  Arnold Redoblado
#Date:  2016-03-25
#Purpose:  Make a shopping cart app and output receipt from orders when requested

class Inventory

  attr_accessor :inventory

  def initialize

    @inventory = [
      { :type  => "book",
        :description => "Sense & Sensibility",
        :qty => 1,
        :import => false,
        :price => 12.49
      },
      { :type => "music",
        :description => "The Irish Rovers",
        :qty => 1,
        :import => false,
        :price => 14.99
      },
      { :type => "food",
        :description => "Kit Kat",
        :qty => 1,
        :import => false,
        :price => 0.85
      },
      { :type => "food",
        :description => "Lady Godiva (Box of 4)",
        :qty => 1,
        :import => true,
        :price => 10.00,
      },
      { :type => "item",
        :description => "Coco Mademoiselle",
        :qty => 1,
        :import => true,
        :price => 47.50
      }
    ]

  end

  def find( description )

    #description = options[ :description ]
      if @inventory.find{ | i | i[ :description ] == description }
        @inventory.find{ | i | i[ :description ] == description }
      end

  end

  def list

    @inventory.each do | i |

      puts "TYPE:        #{ i[ :type ] }"
      puts "DESCRIPTION: #{ i[ :description ] }"
      puts "QUANTITY:    #{ i[ :qty ] }"
      puts "IMPORT_FLAG: #{ i[ :import ] }"
      puts "PRICE:       $#{ i[ :price ] }"

    end

  end

end

class Shopping_cart

  attr_accessor :shopping_list, :db

  def initialize( incoming_db )

    @shopping_list = []
    @db = incoming_db

  end

  def add( item )

        #If item does exist in my inventory but not in my shopping cart, add item
        if @db.find( item ) && not( @shopping_list.find{ | list | list[ :description ] == item } )
          @shopping_list << @db.find( item )

        #If item does exist in my inventory and in my shopping cart, add to quantity
        elsif @db.find( item )  && ( @shopping_list.find{ | list | list[ :description ] == item } )
          @shopping_list[ @shopping_list.find_index{ | list | list[ :description ] == item } ][ :qty ] += 1

        else
          puts "Item not found.  No item added."

        end

  end

  def list_inventory

    @db.list

  end

  def list_cart

    if @shopping_list.count == 0

        puts "Shopping cart is empty"

    else

      @shopping_list.each_with_index do | i, index |
        puts "ITEM:           #{ index + 1 }"
        puts "DESCRIPTION:    #{ i[ :description ] }"
        puts "QUANTITY:       #{ i[ :qty ] }"
        puts "IMPORT PRODUCT: #{ i[ :import ] }"
        puts "PRICE:          $#{ i[ :price ] }"

      end

    end

  end

  def receipt

    @shopping_list.each do | item |

      puts "#{ item[ :qty ] }   #{item[ :description ] }:  $#{ ( item[ :price ] * item[ :qty ] ).round(2) }"

    end

    puts "Sales Tax:  $0.00"
    puts "Total:  $0.00"

  end

end

#Main
puts "Instantiate objects..."
store = Shopping_cart.new( db = Inventory.new )
puts "List inventory"
store.list_inventory
puts "---"
puts "List cart"
store.list_cart
puts "---"
puts "Test add bogus items"
store.add( "Stuff" )
puts "---"
puts "Test add items in inventory (db)"
store.add( "Sense & Sensibility" )
store.add( "The Irish Rovers" )
store.add( "Kit Kat" )
puts "---"
puts "List items now"
store.list_cart
puts "Test Receipt"
store.receipt
