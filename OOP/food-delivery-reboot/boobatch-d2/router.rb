class Router
  def initialize(attr = {})
    @meals_controller = attr[:meals_controller]
    @customers_controller = attr[:customers_controller]
    @sessions_controller = attr[:sessions_controller]
    @orders_controller = attr[:orders_controller]
    @running = true
  end

  def run
    puts "Welcome to the Le Wagon Pub!"
    puts "----------------------------"

    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          route_manager_action
        elsif @current_user.delivery_guy?
          route_delivery_guy_action
        end
      end
    end
    print `clear`
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
    puts "5. Add a new order"
    puts "6. List all undelivered orders"
    puts "7. Logout"
    puts "8. Exit"
    print "> "
  end

  def print_delivery_guy_menu
    puts "--------------------"
    puts "---- EMP MENU 👦 ---"
    puts "--------------------"
    puts "1. List all of my undelivered orders"
    puts "2. Mark an order as complete"
    puts "3. Logout"
    puts "4. Exit"
    print "> "
  end

  # Dispatch the User REQUEST to the
  # SPECIFIC controller action/method
  # that implements what the User wants to do
  def manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 7 then logout
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def delivery_guy_action(choice)
    case choice
    when 1 then puts "TO IMPLEMENT BY YOU"
    when 2 then puts "TO IMPLEMENT BY YOU"
    when 3 then logout
    when 4 then stop!
    else puts "Try again..."
    end
  end

  # Method to stop the code running by changing
  # the running state
  def logout
    @current_user = nil
  end

  def stop!
    logout
    @running = false
  end
end
