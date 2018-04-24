Rails.application.routes.draw do

  get 'teams/backlog'

  resources :teams do
  	resources :user_stories
  end

  get 'main/index'

  get 'main/test'


  # devise_for :users, controllers: { registrations: 'user/registrations' }
  devise_for :users, controllers: { registrations: 'user/registrations', omniauth_callbacks: 'user/omniauth_callbacks' }
  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
