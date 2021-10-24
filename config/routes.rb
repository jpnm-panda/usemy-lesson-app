Rails.application.routes.draw do

  get 'users/new'
  get 'users/create'
  get 'users/me'
  get 'home/index'
  get 'sessions/create'
  get 'sessions/destroy'

  # boards resourcs で事足りるがheader_link_item helper のため（ルートページが必要）に設定しておく
  root 'home#index'

  # resources の後に複数形でリソース名をシンボルで指定することで、RESTfull なルーティングを作成する
  resources :boards
  resources :comments, only: %i[create destroy]
end
