Rails.application.routes.draw do

  devise_for :users

  root 'pages#home'
  
  get "/projects/new_card" => "projects#new_card", as: "new_card"

  resources :projects, :only => [:new, :create, :edit, :update, :show, :index] do
    resources :proposals, :only => [:new, :create, :edit, :update, :show, :index]
  end

  post "/projects/create_card" => "projects#create_card", as: "create_card"

  post "/projects/debit_card" => "projects#debit_card", as: "debit_card"

  resources :users, :only => [:show]
  resource :user, :only => [] do
    member do
      get :me
      get :edit
      put :update, :as => :update_profile
    end
  end

  resources :messages do
    collection do
      get 'outbox'
    end
  end

end
