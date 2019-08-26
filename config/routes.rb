Rails.application.routes.draw do
 root 'top#top'
 get '/home/about' => 'top#about', as: 'about'
 devise_for :users
 resources :books
 resources :users

 
  # For details on the DSL availablew within this file, see http://guides.rubyonrails.org/routing.html
end
