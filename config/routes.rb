Rails.application.routes.draw do

  get 'relationships/follower'
  get 'relationships/following'
  devise_for :admin, controllers: {
        sessions: 'admin/sessions'
  }

  namespace :admin do
    get "top" => "homes#top", as: "top"

    patch "users/leave" => "users#leave", as: "leave"
    resources :users, only: [:index, :show, :edit, :update]
    resources :occupations, only: [:index, :create, :edit, :update]
    resources :posts, only: [:index, :show, :destroy]
    resources :category_media, only: [:index, :create, :edit, :update]
    resources :category_styles, only: [:index, :create, :edit, :update]
    resources :category_motifs, only: [:index, :create, :edit, :update]
  end


  devise_for :users, controllers: {
        sessions: 'public/sessions',
        registrations: 'public/registrations',
  }

  namespace :public do
    root "homes#top", as: "top"
    get "users/my_page" => "users#my_page", as: "my_page"
    get "users/quit" => "users#quit", as: "quit"
    patch "users/leave" => "users#leave", as: "leave"

    resources :users, only: [:index, :show, :edit, :update]
    resources :posts
  end

end
