Rails.application.routes.draw do
  resources :goals, except: [:new, :edit]
  use_doorkeeper

  resources :users, except: [:new, :edit]
end
