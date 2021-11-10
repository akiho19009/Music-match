Rails.application.routes.draw do


  devise_for :users
  
  root to: 'homes#top'

  #ルーティングを一括して自動生成
  #onlyで生成するルーティングを限定
  resources :music_images, only: [:new, :create, :index, :show, :destroy]

end
