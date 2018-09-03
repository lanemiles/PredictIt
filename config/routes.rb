Rails.application.routes.draw do
  get 'welcome_page/welcome'
  root 'welcome_page#welcome'
  resources :markets, only: [:index, :show, :create]
  resources :contracts, only: [:show]
  resources :price_sets, only: [:show]
  get '/update/', to: 'markets#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
