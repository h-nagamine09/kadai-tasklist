Rails.application.routes.draw do
 # トップページへのリンク。
  root to: 'tasks#index'

  get 'login', to: 'sessions#new' #ログイン
  post 'login', to: 'sessions#create' #ログイン実行
  delete 'logout', to: 'sessions#destroy' #ログアウト
  
  get 'signup', to: 'users#new' #新規ユーザー登録
  resources :users, only: [:new, :create] 
  
  resources :tasks   #, except: [:edit] only: [:index, :show ,:new, :edit, :update, :create, :destroy]
end