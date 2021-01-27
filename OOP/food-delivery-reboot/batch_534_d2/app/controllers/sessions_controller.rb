require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    # Prompt for username
    username = @sessions_view.ask_user_for("username")
    # Prompt for password
    password = @sessions_view.ask_user_for("password")
    # Find the employee from the repository
    employee = @employee_repository.find_by_username(username)
    # Match the credentials
    if employee && employee.password == password
    # If the credentials match, do something
      employee
    else
      @sessions_view.print_wrong_credentials
      login
    end
    # Else show an error and to try again
  end
end
