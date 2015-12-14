Rails.application.routes.draw do
  #use_doorkeeper

  resources :goals, except: [:new, :edit]
  resources :users, except: [:new, :edit]
end
