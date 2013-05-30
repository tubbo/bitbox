Bitbox::Application.routes.draw do
  resources :folders, except: [:new, :edit, :update] do
    resources :entities, except: [:edit, :update]
  end

  devise_for :users

  root :to => 'folders#index'
end
