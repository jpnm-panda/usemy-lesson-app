Rails.application.routes.draw do

  get 'mypage', to: 'users#me'

  post 'login', to: 'sessions#create'
  
  delete 'logout', to: 'sessions#destroy'

  # boards resourcs で事足りるがheader_link_item helper のため（ルートページが必要）に設定しておく
  root 'home#index'

  # resources の後に複数形でリソース名をシンボルで指定することで、RESTfull なルーティングを作成する
  resources :boards
  resources :comments, only: %i[create destroy]
  resources :users, only: %i[new create]
end
