Rails.application.routes.draw do
  use_doorkeeper

  resources :users,               except: [:new, :edit] do
    member do
      get :following, :followers
    end
  end
  resources :goals,               except: [:new, :edit] do
    member do
      put "/vote_up" => "goals#vote_up", as: :vote_up
      put "/vote_down" => "goals#vote_down", as: :vote_down
    end
    resources :comments,           except: [:new, :edit]
  end

  post "/follow/:user_id" => "relationships#follow", as: :follow
  post "/unfollow/:user_id" => "relationships#unfollow", as: :unfollow
  get "/comments" => "comments#all_comments", as: :all_comments

end
