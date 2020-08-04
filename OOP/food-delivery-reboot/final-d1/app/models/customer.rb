class Customer
  attr_accessor :id # read and write :id
  attr_reader :name, :address

  def self.csv_headers
    %w[id name address]
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def to_array
    [@id, @name, @address]
  end

  # In Ruby, most objects RESPOND to a .to_s call.
  # However, if you do not override the implementation
  # of this method, converting an instance of Customer
  # to String would look like this:
  #
  # #<Customer:0x00007ff4be01dc08>
  #
  # We want to teach our model to display its data as
  # a string so that we can use it in the View
  def to_s
    "#{name} | Address: #{address}"
  end
end
