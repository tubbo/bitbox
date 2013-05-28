Bitbox::Application.routes.draw do
  resources :entities, except: [:update]

  devise_for :users

  root :to => 'entities#index'
end
