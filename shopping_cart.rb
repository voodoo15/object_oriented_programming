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
      },
      { :type => "item",
        :description => "Yves Saint Laurent Black Opium",
        :qty => 1,
        :import => true,
        :price => 27.99
      },
      { :type => "item",
        :description => "Dolce & Gabbana Light Blue",
        :qty => 1,
        :import => false,
        :price => 18.99
      },
      { :type => "medical",
        :description => "Aspirin Regular Strength",
        :qty => 1,
        :import => false,
        :price => 9.75
      },
      { :type => "food",
        :description => "Ferrero Rocher",
        :qty => 1,
        :import => true,
        :price => 11.25
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

    total_price = 0.00
    total_sales_tax = 0.00
    total_import_tax = 0.00

    @shopping_list.each do | item |

      puts "#{ item[ :qty ] }   #{item[ :description ] }:  $#{ '%.02f' % ( item[ :price ] * item[ :qty ] ) }"

      #unless they are books, food, medical then taxes = item * 0.10
      total_sales_tax += ( item[ :price ] * item[ :qty ] * 0.1 ) unless item[ :type ] == "book" || item[ :type ] == "food" || item[ :type ] == "medical"

      #if my item is imported, import duty = item * 0.05
      total_import_tax += ( item[ :price ] * item[ :qty ] * 0.05 ) if item[ :import ] == true

      #Add to total as we go along
      total_price += ( item[ :price ] * item[ :qty ] )

    end

    puts "Sales Tax:   $#{ '%.02f' % total_sales_tax.round(2) }"
    puts "Import Tax:  $#{ '%.02f' % total_import_tax.round(2) }"
    puts "Total:       $#{ '%.02f' % ( total_price + total_sales_tax + total_import_tax ).round(2) }"

  end

end

#Main
puts "Instantiate objects..."
register1 = Shopping_cart.new( db = Inventory.new )
puts "List inventory"
register1.list_inventory
puts "---"
puts "List cart"
register1.list_cart
puts "---"
puts "Test add bogus items"
register1.add( "Stuff" )
puts "---"
puts "Test add items in inventory (db)"
register1.add( "Sense & Sensibility" )
register1.add( "The Irish Rovers" )
register1.add( "Kit Kat" )
puts "---"
puts "List items now"
register1.list_cart
puts "Test Receipt 1"
register1.receipt

puts "Test Receipt 2"
register2 = Shopping_cart.new( db = Inventory.new )
register2.add( "Lady Godiva (Box of 4)" )
register2.add( "Coco Mademoiselle" )
register2.receipt

puts "Test Receipt 3"
register3 = Shopping_cart.new( db = Inventory.new )
register3.add( "Yves Saint Laurent Black Opium" )
register3.add( "Dolce & Gabbana Light Blue" )
register3.add( "Aspirin Regular Strength" )
register3.add( "Ferrero Rocher" )
register3.receipt
