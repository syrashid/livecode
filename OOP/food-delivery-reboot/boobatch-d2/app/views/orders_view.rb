class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order}"
    end
  end

  def prompt_for(something)
    puts "Choose a #{something}"
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    gets.chomp.to_i - 1
  end
end
