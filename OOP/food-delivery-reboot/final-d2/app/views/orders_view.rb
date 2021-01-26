require_relative 'base_view'

class OrdersView < BaseView
  def ask_user_for_index
    puts "Index?"
    print "> "
    gets.chomp.to_i - 1
  end

  def prompt_for(stuff)
    puts "Choose a #{stuff}"
  end
end
