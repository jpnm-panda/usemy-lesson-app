Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'boards#index'
  # resources の後に複数形でリソース名をシンボルで指定することで、RESTfull なルーティングを作成する
  resources :boards, only: [:index, :new, :create, :show, :edit]
end
