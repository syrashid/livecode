class View
  def display(recipes)
    puts "Listing recipes!"
    puts " -------------------------- "
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.status ? '[x]' : '[ ]'} #{recipe.name}"
      puts "> #{recipe.description}"
      puts "Time: #{recipe.prep_time} - Difficulty: #{recipe.difficulty}"
    end
  end

  def ask_for(element)
    puts "Please provide a recipe #{element}"
    print "> "
    gets.chomp
  end

  def ask_for_recipe
    attr = {}
    attr[:name] = ask_for("name")
    attr[:description] = ask_for("description")
    attr[:prep_time] = ask_for("prep time")
    attr[:difficulty] = ask_for("description")
    attr
  end
end
