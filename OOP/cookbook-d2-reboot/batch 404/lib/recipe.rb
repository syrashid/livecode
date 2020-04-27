class Recipe
  attr_reader :name, :description, :prep_time, :difficulty, :status

  def initialize(attr = {})
    @name = attr[:name]
    @description = attr[:description]
    @prep_time = attr[:prep_time]
    @difficulty = attr[:difficulty]
    @status = attr[:status] || false
  end

  # Better than writing it as an accessor, we dont' want users to have access to the status
  def mark_as_done!
    @status = true
  end
end
