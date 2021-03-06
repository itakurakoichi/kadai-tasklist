Rails.application.routes.draw do

  get 'todos/index'

  get 'todos/show'

  get 'todos/create'

  get 'todos/destroy'

  # トップページのrouting設定
  root to: 'toppages#index'
  
  # ログイン機能のrouting設定
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # user登録のrouting設定
  get 'signup', to: 'users#new'
  # 任意のrouterのみ追加
  resources :users, only: [:index, :show, :new, :create]
  
  # タスクのrouting
  resources :tasks

  # Todo の routing
  resources :todos
end
