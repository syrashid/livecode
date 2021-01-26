class MealsView
#  def initialize; end

  def display(elements)
    elements.each_with_index do |element, index|
      # 1. Margharita - Price: $10
      puts "#{index + 1}. #{element}"
    end
  end

  def ask_user_for(input)
    puts "What is the #{input} for the meal?"
    print "> "
    gets.chomp
  end
end
