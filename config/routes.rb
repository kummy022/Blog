Rails.application.routes.draw do

  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 
  # root "articles#index"

   root "welcome#home"

   get "about", to: "welcome#about"

   get "signup", to: "users#new"

   get "login", to: "sessions#new" 

   post "login", to: "sessions#create"

   delete "/logout", to: "sessions#destroy"

   resources :users, except: [:new]

   resources :categories, except: [:destroy]


  
end
