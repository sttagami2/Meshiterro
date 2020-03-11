Rails.application.routes.draw do
  devise_for :users
  root 'post_images#index'



  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]                #いいね機能と画像投稿機能を紐付けた
    resource :post_comments, only: [:create, :destroy]            #コメント機能と画像投稿機能を紐付けた
    # resourceが単数形になっていることに注意
    # → 単数だとそのコントローラのidがリクエストに含まれなくなる
    # URLの表示が分かりやすくなる → 親子関係で表示される → 「ネストする」という
  end
  resources :users, only: [:show]

end
