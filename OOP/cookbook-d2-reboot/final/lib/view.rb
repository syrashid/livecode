class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.status ? '[X]' : '[ ]'} #{recipe.name}: #{recipe.description} (#{recipe.prep_time})\nDifficulty: #{recipe.difficulty}"
    end
  end

  def ask_for(element)
    puts "Please provide a recipe #{element}"
    print "> "
    gets.chomp
  end
end
