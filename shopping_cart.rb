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

  def initialize( db )

    @shopping_list = []
    @db = db

  end

  def add( item )

        if @db.find( item ) && not( @shopping_list.find{ | list | list[ :description ] == item } )
          @shopping_list << @db.find( item )

        elsif @db.find( item )  && ( @shopping_list.find{ | list | list[ :description ] == item } )
          @shopping_list[ @shopping_list.find_index{ | list | list[ :description ] == item } ][ :qty ] += 1

        else
          puts "Item not found.  No item added."

        end

  end

  def list

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

end

#Main
puts "Instantiate objects..."
store = Shopping_cart.new( db = Inventory.new )
puts "List objects..."
store.list
puts "Test add bogus items"
store.add( "Stuff" )
puts "Test add items in inventory (db)"
store.add( "Kit Kat" )
store.add( "The Irish Rovers" )
store.add( "The Irish Rovers" )
puts "List items now"
store.list
