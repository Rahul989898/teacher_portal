Rails.application.routes.draw do
  get 'students/index'
  get 'students/show'
  get 'students/new'
  get 'students/create'
  get 'students/edit'
  get 'students/update'
  get 'students/destroy'
  # get 'dashboard/index'
  devise_for :teachers
  root to: "dashboard#index"


  resources :students

end
