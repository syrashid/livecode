require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    # Ask for username
    username = @sessions_view.ask_for("username")
    # Ask for password
    password = @sessions_view.ask_for("password")

    employee = @employee_repository.find_by_username(username)

    if employee && employee.password == password
    # If password and username are correct
      # Kick off application with right menu
      return employee
    else
      login
    end
  end


end
