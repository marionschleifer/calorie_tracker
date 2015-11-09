Rails.application.routes.draw do

   resources :entries do
    collection do
      post :send_message
    end
   end

   resources :users
   resource :sessions

  root 'sessions#new'

end
