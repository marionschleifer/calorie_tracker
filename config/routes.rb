Rails.application.routes.draw do

   resources :entries
   resources :users
   resource :sessions

  root 'sessions#new'

end
