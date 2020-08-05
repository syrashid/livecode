require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  # This method is what creates the session for the user
  # It works by asking for a user name and password
  # If those username and password match a user in the employee repository, the user is granted access in their own session
  # If no match is found, the user is once more prompted for a username and password
  def login
    username = @sessions_view.ask_for(:username)
    password = @sessions_view.ask_for(:password)
    employee = @employee_repository.find_by_username(username)
    return employee if employee && employee.password == password

    @sessions_view.print_wrong_credentials
    login
  end
end
