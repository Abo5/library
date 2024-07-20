Rails.application.routes.draw do
  get '/home', to: 'home#home'
  get '/books', to: 'home#books'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/sections', to: 'home#sections'

  # get 'home/index3'
  # get 'home/create'
  # get 'home/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
