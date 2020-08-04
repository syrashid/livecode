class Router
  def initialize(attr={})
    # Store ALL controllers in instance variables
    # so that I can use them throughout the Router
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  # This method kicks off the actual program
  def run
    puts "Welcome to the Le Wagon Pub!"
    puts "----------------------------"

    # After an action is completed, I want to
    # display the menu again (looping)
    # This should only stop when running is false
    while @running
      # Print all user action options
      print_menu
      # Retrieve the choice, convert to integer
      choice = gets.chomp.to_i
      print `clear`
      # Route the user desire to the correct controller action
      route_action(choice)
    end
  end

  private

  def print_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "8. Exit"
    print "> "
  end

  # Dispatch the User REQUEST to the
  # SPECIFIC controller action/method
  # that implements what the User wants to do
  def route_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 8 then stop!
    else puts "Try again..."
    end
  end

  # Method to stop the code running by changing
  # the running state
  def stop!
    @running = false
  end
end
