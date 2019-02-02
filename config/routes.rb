Rails.application.routes.draw do
 # トップページへのリンク。
  root to: 'toppages#index'

  get 'login', to: 'sessions#new' #ログイン
  post 'login', to: 'sessions#xcreate' #ログイン実行
  delete 'logout', to: 'sessions#destroy' #ログアウト
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show ,:new, :create] 
  
  resources :microposts, only: [:create, :destroy]
end