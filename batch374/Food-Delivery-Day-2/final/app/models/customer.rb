# frozen_string_literal: true

class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  # method to print information about customers, used in views
  def pretty_print
    puts "#{@id}. #{@name} lives at #{@address}"
  end
end
