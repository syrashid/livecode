require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    username = @sessions_view.ask_for(:username)
    password = @sessions_view.ask_for(:password)
    employee = @employee_repository.find_by_username(username)
    return employee if employee && employee.password == password
    # Stop the code here, code it for only one loop, then work through the process of looping it in the correct manner

    # After you show it work once, then do the below

    @sessions_view.print_wrong_credentials
    login
  end
end
