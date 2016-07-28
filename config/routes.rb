Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles

  post '/signup', to: 'users#signup'
  post '/login',  to: 'users#login'

end
