class View
  def display(recipes)
    puts "Listing all of your recipes!"
    puts "----------------------------"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_for(item)
    puts "Please provide a recipe #{item}"
    gets.chomp
  end
end
