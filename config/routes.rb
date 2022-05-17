Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'events#index'

  get 'static_pages/index'

  resources :users

  resources :events do  
    resources :attendances
  end
end
