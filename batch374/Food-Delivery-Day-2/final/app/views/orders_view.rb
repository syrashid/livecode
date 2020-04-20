# frozen_string_literal: true

class OrdersView
  def ask_for(label)
    puts "#{label}?"
    print '> '
    gets.chomp
  end

  def ask_for_integer(label)
    puts "#{label}?"
    print '> '
    gets.chomp.to_i
  end

  def display(orders)
    orders.each(&:pretty_print)
  end

  def display_delivery_guys(delivery_guys)
    delivery_guys.each(&:pretty_print)
  end
end
