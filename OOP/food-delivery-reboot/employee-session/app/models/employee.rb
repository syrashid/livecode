class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def self.csv_headers
    %w[id name password role]
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end

  def to_array
    [@id, @name, @password, @role]
  end
end
