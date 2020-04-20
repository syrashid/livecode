# frozen_string_literal: true

class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == 'manager'
  end

  def delivery_guy?
    @role == 'delivery_guy'
  end

  # useful in the repository to cleanly give values to a row
  def to_csv_row
    [@id, @username, @password, @role]
  end

  # method to print information about customers, used in views
  def pretty_print
    puts "#{@id} - #{@username}"
  end

  # useful for cleaning up the csv methods in repos
  def self.headers
    %w[id username password role]
  end
end
