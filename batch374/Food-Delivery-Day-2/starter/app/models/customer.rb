# frozen_string_literal: true

class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attr_hash = {})
    @id = attr_hash[:id]
    @name = attr_hash[:name]
    @address = attr_hash[:address]
  end

  def to_s
    puts "#{@id}. #{@name} lives at #{@address}"
  end
end
