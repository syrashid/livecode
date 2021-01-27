class BaseView
  def display(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1}. #{element}"
    end
  end

  def ask_user_for(stuff)
    puts "What is the #{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
