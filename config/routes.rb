Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resources :projects, :only => [:new, :create, :edit, :update, :show, :index] do
  end
    

  resource :user, :only => [] do
    member do
      get :me
      get :edit
      put :update, :as => :update_profile
    end
  end
end
