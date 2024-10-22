class ApplicationController < ActionController::Base
  before_action :authenticate_teacher!

  protected

  def after_sign_in_path_for(resource)
    root_path  # Redirect to the students listing page or any other path
  end
end
