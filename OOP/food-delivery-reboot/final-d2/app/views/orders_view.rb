class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order}"
    end
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    gets.chomp.to_i - 1
  end

  def prompt_for(stuff)
    puts "Choose a #{stuff}"
  end
end
