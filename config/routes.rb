Rails.application.routes.draw do
  get 'welcome_page/welcome'
  root 'welcome_page#welcome'
  resources :markets, only: [:index, :show]
  resources :contracts, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
