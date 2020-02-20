
@products = [
  {name: "Milk" , price: 3.29},
  {name: "Eggs", price: 5.09},
  {name: "Cheese", price: 6.39},
  {name: "Tortilla", price: 4.59},
  {name: "Steak", price: 6.99},
  {name: "Chicken", price: 5.99},
  {name: "Yogurt", price: 2.99},
  {name: "Oranje Juice", price: 4.99},
  {name: "Peanut Butter", price: 3.99},
  {name: "Cereal", price: 2.99},
  {name: "Frozen Pizza", price: 8.99}
]

@cart = [
]

@employee = [ 
  {name: "", price: ""}
]



# Add new items to the grocery store.

def greeting
  puts `clear`
    puts "******** Welcome to BIG NICK Grocceries ********"
    puts "Where we sell everything you could possibly need"
    puts
    puts
    puts "You take a cart..........."
    puts 
    puts
    sleep 1
  main_menu
end

def main_menu
  print " What would you like to do? "
  puts "
  1) View products
  2) Add to Cart
  3) Remove from Cart
  4) View Cart Total
  5) Checkout
  6) Store Options
  7) Leave
  "
  menu_choice = gets.strip.to_i
  case menu_choice
    when 1
      #loops the product array for each item and price
      puts `clear`
     view_products
    when 2
      #add an item to the cart, shows the products
      puts `clear`
      add_cart
    when 3
      puts `clear`
      remove_cart
    when 4
      #shows the cart and the dollar total with your items
      puts `clear`
      view_cart
    when 5
      #checkout menu
      puts `clear`
      checkout
    when 6
      #add or remove a product
      puts `clear`
        store_options
    when 7
      #leave the store
      puts `clear`
      puts "Thank you for shopping!"
      exit

    else
      # Error
      puts "Please choose 1 - 7."
      main_menu
  end
end



############### Main Menu Options
def view_products
  #lists all available products
  @products.each_with_index do |product, i|
    puts "#{i + 1}) #{product[:name]} for $#{product[:price]}"
  end
  shopping_menu
end



def add_cart
  view_products
end

def shopping_menu
  #menu while viewing products
  puts "Pick an item to add to your cart, or press 0 for main menu."
  shopping_choice = gets.strip.to_i
  #when they select an item to add to cart
  if shopping_choice % 1 == 0 && shopping_choice != 0
    puts "You pick up the #{@products[shopping_choice - 1][:name]}..."
    @cart << @products[shopping_choice - 1]
    sleep 1
    puts "...and you put it in your cart."
    sleep 0.5
    view_products
  elsif shopping_choice < 0
    #wrong choice
    puts "Try Again"
    sleep 1
    view_products
  else
    main_menu
  end
end

def remove_cart
  #Removes a product from the cart
  puts "Which item would you like to remove?"
    @cart.each_with_index do |item, i|
    puts "#{i + 1}) #{item[:name]}"
    end
  remove_choice = gets.to_i
  puts "You remove the #{@cart[remove_choice - 1][:name]} from your cart."
   @cart.delete_at(remove_choice - 1)
  puts
  sleep 1
  main_menu
end

def view_cart
  #lists the items in the cart
  puts "Your cart:"
    @cart.each_with_index do |item, i|
    puts "#{i + 1}) #{item[:name]}"
    end
  #puts the cart total
    cart_total = 0
    @cart.each do |item|
      cart_total = cart_total + item[:price]
    end
      if cart_total == 0   #empty cart message
        puts "Your cart is empty."
      else
    print "Your total is: $" 
    print cart_total.round(2)
    puts
      end
    main_menu
end

###Declaring these methods before the employee options
def product_name
  # gets user input for product name to add
  puts "What is the item called?"
    @add_product = gets.strip
    if @add_product == ''
      puts "Please enter a item name."
      product_name
    else
    end
end
def product_price
  puts "How much will you sell it for?"
    @add_price = gets.to_f
    if @add_price == ''
      puts "Please enter a product price."
      product_price
    else
    end
end

#### Behind the counter i.e. add/remove product
def store_options
  puts "Where have you been? The shelves need to be stocked!"
  sleep 1
  puts
  puts "Add or remove an item?
  1) Add Item
  2) Remove Item
  0) Main Menu
  "
  employee_choice = gets.to_i
  case employee_choice
    when 1
      def new_product
        # Creates a new product in @product array
        puts "Lets create the item."
        product_name
        product_price
        @employee = {name: @add_product, price: @add_price}
        @products << @employee
        puts "You put the #{@add_product} on the shelf for $#{@add_price}"
        main_menu
      end
      sleep 1
      new_product
    when 2
      #Removes a product from the @products array
      @products.each_with_index do |product, i|
        puts "#{i + 1}) #{product[:name]} for $#{product[:price]}"
      end

        puts "Which item would you like to remove?"
        employee_remove = gets.to_i
        puts "#{@products[employee_remove - 1][:name]} has been taken off of the shelves."
        @products.delete_at(employee_remove - 1)
        sleep 1
        main_menu
    end
end

def checkout
  puts "Your Cart: "
  @cart.each_with_index do |item, i|
    puts "#{i + 1}) #{item[:name]}"
    end
  #puts the cart total
    cart_total = 0
    @cart.each do |item|
      cart_total = cart_total + item[:price]
    end
      if cart_total == 0   #empty cart message
        puts "Your cart is empty."
      else
    print "Your total is: $" 
    print cart_total.round(2)
    puts
      end
      puts "
      1)Checkout
      2)Keep Shopping
      "
      checkout_choice = gets.to_i
      case checkout_choice
        when 1
          puts "You swipe your card..."
          sleep 1
          puts "...Accepted!"
          sleep 1
          puts "Thank you for shopping with BIG NICK"
          puts "Have a nice day!"
          sleep 1
          exit
        when 2
          main_menu
        else
          puts "Please choose an option"
          sleep 1
          checkout
      end
end


greeting