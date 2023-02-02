Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'people#index'
  resources :people
  post '/upload_directory_data', to: 'people#upload_directory_data'
end
