class MealsView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.to_s}"
    end
  end

  def ask_user_for(stuff)
    puts "What is the #{stuff}?"
    print ">"
    gets.chomp
  end
end
