Rails.application.routes.draw do
  resources :contacts
  #get '/contacts', to: "contacts#index" Rota manual
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
