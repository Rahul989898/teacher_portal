Rails.application.routes.draw do
  # get 'dashboard/index'
  devise_for :teachers
  root to: "dashboard#index"

end
