# frozen_string_literal: true

class CustomerView
  def display(customers)
    customers.each(&:to_s)

    # customers.each do |customer|
    #   customer.to_s
    # end
  end

  def ask_for_info
    puts 'What customer would you like to add?'
    name = gets.chomp
    puts 'Where does the customer live?'
    address = gets.chomp
    { name: name, address: address }
  end

  def ask_for_id
    puts 'Id?'
    gets.chomp.to_i
  end
end
