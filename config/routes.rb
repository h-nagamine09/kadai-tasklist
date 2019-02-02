Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

 # トップページへのリンク。
  root to: 'toppages#index'
 
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#xcreate'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show ,:new, :create] 
end
