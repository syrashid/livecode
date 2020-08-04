class Router
  def initialize(attr = {})
    # Store ALL controllers in instance variables
    # so that I can use them throughout the Router
    @meals_controller = attr[:meals_controller]
    @customers_controller = attr[:customers_controller]
    @sessions_controller = attr[:sessions_controller]
    @running = true
  end

  def run
    puts "Welcome to the Le Wagon Pub!"
    puts "----------------------------"
    while @running
      # First step is to check weather or not the current
      # user is an employee of the restaurant
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          route_manager_action
        else
          route_delivery_guy_action
        end
      end
      print `clear`
    end
  end

  private

  def route_manager_action
    print_manager_menu
    choice = gets.chomp.to_i
    print `clear`
    manager_action(choice)
  end

  def route_delivery_guy_action
    print_delivery_guy_menu
    choice = gets.chomp.to_i
    print `clear`
    delivery_guy_action(choice)
  end

  def print_manager_menu
    puts "--------------------"
    puts "---- MGR MENU 🧔 ---"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Logout"
    puts "6. Exit"
    print "> "
  end

  def print_delivery_guy_menu
    puts "--------------------"
    puts "---- EMP MENU 👦 ---"
    puts "--------------------"
    puts "1. Delivery guy action #1"
    puts "2. Delivery guy action #2"
    puts "3. Logout"
    puts "4. Exit"
    print "> "
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then logout!
    when 6 then stop!
    else puts "Try again..."
    end
  end

  def delivery_guy_action(choice)
    case choice
    when 1 then puts "Complete delivery action 1"
    when 2 then puts "Complete delivery action 2"
    when 3 then logout!
    when 4 then stop!
    else puts "Try again..."
    end
  end

  def logout!
    @current_user = nil
  end

  def stop!
    logout!
    @running = false
  end
end
