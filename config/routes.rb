Rails.application.routes.draw do
  resources :trips do
    resources :travels, only: [ :index, :new, :create ]
    resources :accomodations, only: [ :index, :new, :create ]
    resources :tasks, only: [ :index, :new, :create ]
    resources :diaries, only: [ :index, :new, :create ]
  end
    resources :travels, only: [ :show, :edit, :update, :destroy ]
    resources :accomodations, only: [ :show, :edit, :update, :destroy ]
    resources :tasks, only: [ :show, :edit, :update, :destroy ]
    resources :diaries, only: [ :show, :edit, :update, :destroy ]

    resources :stays do
      resources :trips, only: [ :index, :new, :create ]

    end




  resources :photos
  resources :stays
  resources :tasks










  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
