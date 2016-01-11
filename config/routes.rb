Rails.application.routes.draw do
  use_doorkeeper

  root "users#index"

  resources :users,               except: [:new, :edit] do
    member do
      get :following, :followers
    end

    member do
      get :goals
    end
  end

  resources :goals,               except: [:new, :edit] do
    resources :comments,           except: [:new, :edit]

    member do
      put "/vote_up" => "goals#vote_up", as: :vote_up
      put "/vote_down" => "goals#vote_down", as: :vote_down
    end
  end

  post "/follow/:user_id" => "relationships#follow", as: :follow
  post "/unfollow/:user_id" => "relationships#unfollow", as: :unfollow
  get "/comments" => "comments#all_comments", as: :all_comments
  get "/me" => "users#me", as: :me
  get "/my_goals" => "users#my_goals", as: :my_goals

end
