class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def self.csv_headers
    %w[id name password role]
  end

  def initialize(attr={})
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
  end

  def to_array
    [@id, @name, @password, @role]
  end

  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end
end
