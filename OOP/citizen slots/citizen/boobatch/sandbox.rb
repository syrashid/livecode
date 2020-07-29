require_relative 'citizen'


sy = Citizen.new("Sy", "Rashid", 28)
nico = Citizen.new("Nico", "Proto", 17)
sy.fix_name('barbara')


puts "What is Sy's full name: #{sy.full_name}"
puts "Can Sy vote?  #{sy.can_vote?}"
puts "Can Nico vote?  #{nico.can_vote?}"
