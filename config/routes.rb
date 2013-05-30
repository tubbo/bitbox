Bitbox::Application.routes.draw do
  resources :folders


  resources :entities, except: [:update]

  devise_for :users

  root :to => 'entities#index'
end
