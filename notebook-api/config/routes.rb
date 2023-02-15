Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'
  resources :auths, only: [:create]
  resources :kinds

  api_version(:module => "V1", :parameter => {:name => "version", :value => "1"}) do
    resources :contacts do
      resource :kind, only: [:show] #Cria a rota que retona o kind do contato sem precisar passar o id do kind (belongs_to)
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show] 
      resource :phones, only: [:show], path: 'relationships/phones'
      resource :phone, only: [:show, :update, :create, :destroy] 
      resource :phone, only: [:show, :update, :create, :destroy], path: 'relationships/phone'
      
      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end
  
  api_version(:module => "V2", :parameter => {:name => "version", :value => "2"}) do
    resources :contacts do 
      resource :kind, only: [:show] #Cria a rota que retona o kind do contato sem precisar passar o id do kind (belongs_to)
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show] 
      resource :phones, only: [:show], path: 'relationships/phones'
      resource :phone, only: [:show, :update, :create, :destroy] 
      resource :phone, only: [:show, :update, :create, :destroy], path: 'relationships/phone'
      
      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end

end
