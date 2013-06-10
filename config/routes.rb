Bitbox::Application.routes.draw do
  resources :folders do
    resources :entities, except: [:edit, :update]
  end

  devise_for :users

  root :to => 'folders#index'
end
