# frozen_string_literal: true

require 'io/console'

class SessionsView
  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print '> '
    gets.chomp
  end

  def ask_for_password
    puts 'password?'
    print '> '
    # this line of code with the require above, makes it so the user when putting in his password is protected
    STDIN.noecho(&:gets).chomp
  end

  def wrong_credentials
    puts 'Wrong credentials, try again'
  end

  def welcome(employee)
    puts "Welcome #{employee.username.capitalize}!"
  end
end
