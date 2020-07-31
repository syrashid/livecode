class Cookbook
  def initialize
    @recipes = []
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
  end
end
