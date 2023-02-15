Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'
  resources :auths, only: [:create]
  resources :kinds

  scope module: 'v1' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "1" } do 
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

  scope module: 'v2' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "2" } do 
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
