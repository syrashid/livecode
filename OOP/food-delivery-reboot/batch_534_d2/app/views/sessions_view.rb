require_relative './base_view'

class SessionsView < BaseView
  def print_wrong_credentials
    puts "Wrong Credentials, try again!"
  end
end
