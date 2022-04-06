Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :confirmations => 'admins/confirmations',
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions',
    :password => 'admins/passwords'
  }

  resources :articles

  resources :categories

  root "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
