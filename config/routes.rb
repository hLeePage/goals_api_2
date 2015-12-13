Rails.application.routes.draw do
  use_doorkeeper

  resources :users, except: [:new, :edit]
end
