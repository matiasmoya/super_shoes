Rails.application.routes.draw do
  root 'stores#index'

  resources :articles
  resources :stores

  namespace :services, defaults: { format: :json } do
    resources :stores, only: [:index]
    resources :articles, only: [:index]
    get 'articles/stores/:id', to: 'articles_stores#show'
  end

  get "/400" => "errors#bad_request"
  get "/401" => "errors#not_authorized"
  get "/404" => "errors#not_found"
  get "/500" => "errors#exception"
end
