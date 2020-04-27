class View
  def display(recipes)
    puts "Listing recipes!"
    puts " -------------------------- "
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
      puts "Time: #{recipe.prep_time} - Difficulty: #{recipe.difficulty}"
    end
  end

  def ask_for(element)
    puts "Please provide a recipe #{element}"
    print "> "
    gets.chomp
  end
end
