Rails.application.routes.draw do

  get 'teams/backlog'

  resources :teams do
  	resources :user_stories
  end

  get 'main/index'

  root 'home#main'

  # devise_for :users, controllers: { registrations: 'user/registrations' }
  devise_for :users, controllers: { registrations: 'user/registrations' }
end
