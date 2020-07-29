# lower_snake_case  < FOR FILE NAMESn      ex: senior_citizen.rb
# UpperCamelCase  < FOR CLASS DEFINITIONS  ex: SeniorCitizen
# FOLLOW CONVENTION OR YOU WILL HAVE A BAD TIME

class Citizen
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name, age)
    @first_name = fix_name(first_name)
    @last_name = fix_name(last_name)
    @age = age
  end

  def can_vote?
    @age >= 18
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  private

  def fix_name(name)
    name.downcase.capitalize
  end
end



