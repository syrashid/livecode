# frozen_string_literal: true

class Router
  def initialize(sessions_controller, meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run

    employee = @sessions_controller.sign_in

    while @running
      employee.manager? ? display_manager_actions : display_delivery_actions
      action = gets.chomp.to_i
      employee.manager? ? route_mgr_action(action) : route_dlvry_action
    end
  end

  private

  def display_manager_actions
    puts '--------------------'
    puts '------- MENU -------'
    puts '--------------------'
    puts '1. List all meals'
    puts '2. Add a new meal'
    puts '3. List all customers'
    puts '4. Add a new customer'
    puts '8. Exit'
    print '> '
  end

  def route_mgr_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then stop!
    else
      puts 'Try again...'
    end
  end

  def display_delivery_actions
    puts "THIS WORKS"
  end

  def route_dlvry_action
    puts "THE ROUTING WORKS"
  end

  def stop!
    @running = false
  end
end
