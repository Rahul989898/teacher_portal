class DashboardController < ApplicationController
  before_action :authenticate_teacher!  # Ensure the teacher is logged in

  def index
    # Fetch students associated with the logged-in teacher
    @students = current_teacher.students
  end
end
