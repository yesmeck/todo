Rails.application.routes.draw do
  root 'templates#index'

  get ':any', to: 'templates#index'
  get '/templates/:path.html', to: 'templates#template', constraints: { path: /.+/ }

  namespace :api, defaults: { format: :json } do
    resources :todos
  end

  get :sign_up, to: 'users#new'
  post :sign_up, to: 'users#create'
  get :sign_in, to: 'sessions#new'
  post :sign_in, to: 'sessions#create'
  delete :sign_out, to: 'sessions#destroy'

  resources :todos do
    collection do
      post :sort
    end

    member do
      post :complete
      post :uncomplete
    end
  end
end
