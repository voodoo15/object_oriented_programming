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

  def find( options = {} )

    description = options[ :description ]

    @inventory.find{ | i | i[ :description ] == description }

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
