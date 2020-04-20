# frozen_string_literal: true

class Recipe
  attr_reader :name, :description, :prep_time, :difficulty
  attr_accessor :status  # << Remember we need this to be an accessor because we'll be modifying it

  def initialize(name, description, prep_time, status, difficulty)
    @name = name
    @description = description
    @prep_time = prep_time
    @status = status
    @difficulty = difficulty
  end
end
