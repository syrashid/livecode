class CustomersView
  def display(customers)
    customers.each_with_index do |customer, index|
      # String interpolation by default calls to_s on whatever it is trying to interpolate, when we wrote over to_s we choose to return a string that displays the information for the element in the way we desire
      puts "#{index + 1}. #{customer}"
    end
  end

  # Generic ask method for information from the user
  # Needs to be passed a string, output is a string
  def ask_user_for(stuff)
    puts "#{stuff.capitalize} of the customer?"
    print "> "
    return gets.chomp
  end
end
