require_relative '../views/sessions_view'
require 'io/console'

class SessionsController
  def initialize(employee_repo)
    @employee_repo = employee_repo
    @session_view = SessionsView.new
  end

  def sign_in
    username = @session_view.ask_user_for(:username)
    password = @session_view.ask_for_password

    employee = @employee_repo.find_by_username(username)
    if employee && employee.password == password
      @session_view.welcome_employee(username)
      return employee
    else
      @session_view.wrong_credentials
      sign_in
    end
  end
end
