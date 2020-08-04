class CustomersView
  def display(customers)
    customers.each_with_index do |customer, index|
      # We use to_s as a clean way for the element
      # in question to present it's data
      puts "#{index + 1}. #{customer.to_s}"
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
