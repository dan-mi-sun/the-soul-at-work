Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resource :user, :only => [] do
    member do
      get :me
      get :edit
      put :update, :as => :update_profile
    end
  end
end
