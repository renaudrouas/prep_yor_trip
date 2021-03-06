# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :trips do
    resources :travels

    resources :stays

    resources :accomodations

    resources :diaries

    resources :tasks do
      member do
        patch :complete
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# get 'trips', to: 'trips#index', as: :trips
# get 'trips/new"', to: 'trips#new'
# post 'trips', to: 'trips#create'
# get 'trips/:id', to: 'trips#show', as: :trip
# get 'trips/:id/edit', to: 'trips#edit'
# patch  'trips/:id', to: 'trips#update'
# delete "restaurants/:id", to: "restaurants#destroy"
