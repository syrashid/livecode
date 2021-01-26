class Router
  def initialize(attributes = {})
    @meals_controller = attributes[:meals_controller]
    @running = true
  end

  def run
    puts "Welcome to the Le Wagon Pub"
    puts "==========================="

    while running?
      # Print all the user actions
      print_menu
      # Get the users choice
      choice = gets.chomp.to_i
      print `clear`
      # Route the users desire
      route_action(choice)
    end

  end

  private

  def print_menu
    puts "==========================="
    puts "===========MENU============"
    puts "==========================="
    puts "1. List all of the meals"
    puts "2. Add a new meal"
    puts "3. Exit"
  end

  def route_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then stop!
    end
  end

  def stop!
    @running = false
  end

  def running?
    @running
  end

end
