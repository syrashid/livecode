require_relative 'view'
class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  # USER ACTIONS

  def list
    display_list
  end

  def create
    # 1. Ask user for a name (view)
    name = @view.ask_for_stuff("name")
    # 2. Ask user for a description (view)
    description = @view.ask_for_stuff("Description")
    # 3. Create recipe (model)
    recipe = Recipe.new(name, description)
    # 4. Store in cookbook (repo)
    @cookbook.add_recipe(recipe)
    # 5. Display
    display_list
  end

  def destroy
    # 1. Display recipes
    display_list
    # 2. Ask user for index (view)
    index = @view.ask_for_index
    # 3. Remove from cookbook (repo)
    @cookbook.remove_recipe(index)
    # 4. Display
    display_list
  end

  private

  def display_list
    # 1. Get recipes (repo)
    recipes = @cookbook.all
    # 2. Display recipes in the terminal (view)
    @view.display(recipes)
  end
end
