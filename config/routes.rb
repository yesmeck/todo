Rails.application.routes.draw do
  root 'templates#index'

  delete :sign_out, to: 'sessions#destroy'

  get ':any', to: 'templates#index'
  get '/templates/:path.html', to: 'templates#template', constraints: { path: /.+/ }

  namespace :api, defaults: { format: :json } do
    resources :todos do
      collection do
        post :sort
      end
    end
    post :sign_up, to: 'users#create'
    post :sign_in, to: 'sessions#create'
  end

  resources :todos
end
