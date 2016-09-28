Rails.application.routes.draw do
  # devise_for :users
  # root 'tweets#index'
  # get 'tweets' => 'tweets#index'      #tweet一覧画面
  # get 'tweets/new' => 'tweets#new'    #tweet投稿画面
  # post 'tweets' => 'tweets#create'    #tweet投稿機能
  # get 'users/:id' => 'users#show'     #mypageへのルーティング
  # delete 'tweets/:id' => 'tweets#destroy' #tweets削除機能
  # get   'tweets/:id/edit'  => 'tweets#edit' #tweet編集機能
  # patch   'tweets/:id'  => 'tweets#update' #tweet更新機能
  # get 'tweets/:id' => 'tweets#show'       #ツイート詳細画面


  devise_for :users
  root 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end