Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resource :user, :only => [] do
    member do
      get :me
    end
  end
end
