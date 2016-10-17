Rails.application.routes.draw do
  root 'stores#index'

  resources :articles
  resources :stores

  namespace :services, defaults: { format: :json } do
    resources :stores, only: [:index]
    resources :articles, only: [:index]
    get 'articles/stores/:id', to: 'articles_stores#show'
  end

end
