Rails.application.routes.draw do
  # トップページのrouting設定
  root to: 'toppages#index'
  
  # user登録のrouting設定
  get 'signup', to: 'users#new'
  # 任意のrouterのみ追加
  resources :users, only: [:index, :show, :new, :create]
  
  # タスクのrouting設定
  resources :tasks
end
