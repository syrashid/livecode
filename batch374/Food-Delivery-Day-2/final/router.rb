# frozen_string_literal: true

class Router
  def initialize(sessions_controller, meals_controller, customers_controller, orders_controller)
    @sessions_controller = sessions_controller
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @orders_controller = orders_controller
    # instance variable to kick start app in motion and continue running until stopped
    @running = true
  end

  def run
    # logic to sign in employee in sign_in method
    @employee = @sessions_controller.sign_in

    while @running
      # depending on role, either manager or delivery actions displayed
      @employee.manager? ? display_manager_actions : display_employee_actions
      action = ask_action
      @employee.manager? ? route_manager_action(action) : route_employee_action(action)
    end
  end

  private

  def ask_action
    puts 'What do you want to do next?'
    print '> '
    gets.chomp.to_i
  end

  # manager actions and routing

  def display_manager_actions
    puts '--------------------'
    puts '------- MENU -------'
    puts '--------------------'
    puts '1. List all meals'
    puts '2. Add a new meal'
    puts '3. List all customers'
    puts '4. Add a new customer'
    puts '5. Add an order'
    puts '6. View undelivered orders'
    puts '7. Exit'
    print '> '
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 7 then stop!
    else
      puts 'Try again...'
    end
  end

  # deliver actions and routing

  def display_employee_actions
    puts "1. List my orders"
    puts "2. Mark an order as delivered"
    puts "3. Exit"
  end

  def route_employee_action(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 3 then stop!
    else puts "Try again..."
    end
  end

  # method to stop app running
  def stop!
    @running = false
  end
end
