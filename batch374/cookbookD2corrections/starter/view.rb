# frozen_string_literal: true

class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      # in the below line, peep the cool ternary operator we used to designate complete recipes
      puts "#{index + 1}. #{recipe.status ? '[X]' : '[ ]'} #{recipe.name}: #{recipe.description} (#{recipe.prep_time}) (#{recipe.difficulty})"
    end
  end

  def ask_for_stuff(stuff)
    puts "Please provide the #{stuff.capitalize}"
    gets.chomp
  end

  def ask_for_index
    puts 'Please provide an index'
    gets.chomp.to_i - 1
  end
end
