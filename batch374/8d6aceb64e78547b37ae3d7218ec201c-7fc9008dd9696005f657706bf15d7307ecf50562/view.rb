class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_for_stuff(stuff)
    puts "Please provide the #{stuff.capitalize}"
    gets.chomp
  end

  def ask_for_index
    puts "Please provide an index"
    gets.chomp.to_i - 1
  end
end
