Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'working_lists#index'

  resources :working_lists

  resources :charts

  resources :categories

  namespace :admin do
    resources :working_lists
  end

end
