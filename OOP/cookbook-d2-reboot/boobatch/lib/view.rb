class View
  def display(recipes)
    puts "Listing the recipes!"
    puts "----------------------------"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
      puts " - Prep Time: #{recipe.prep_time}"
      puts " - Difficulty: #{recipe.difficulty}"
    end
  end

  def ask_for(item)
    puts "Please provide a recipe #{item}"
    gets.chomp
  end
end
