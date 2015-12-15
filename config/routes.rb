Rails.application.routes.draw do
  use_doorkeeper

  resources :users,               except: [:new, :edit] do
    member do
      get :following, :followers
    end
  end
  resources :goals,               except: [:new, :edit]
  # resources :relationships,       only: [:create, :destroy]

  post "/follow/:user_id" => "relationships#follow", as: :follow
  post "/unfollow/:user_id" => "relationships#unfollow", as: :unfollow

end
