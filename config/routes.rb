Rails.application.routes.draw do

  get 'main/index'


  # devise_for :users, controllers: { registrations: 'user/registrations' }
  devise_for :users, controllers: { registrations: 'user/registrations' }
  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
