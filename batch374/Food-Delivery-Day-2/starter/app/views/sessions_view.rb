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
    STDIN.noecho(&:gets).chomp
  end

  def welcome_employee(username)
    "Welcome #{username.capitalize}"
  end

  def wrong_credentials
    puts "Wrong credentials you hacker"
  end
end
