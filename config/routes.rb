Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Profile Routes
  resources :profiles

  # User Reg/Login
  post '/signup', to: 'users#signup'
  post '/login',  to: 'users#login'

  # Github Info
  get '/github/:username', to: 'github#index'

end
