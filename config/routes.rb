Rails.application.routes.draw do
  get 'archives/show'
  devise_for :admins, :controllers => {
    :confirmations => 'admins/confirmations',
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions',
    :password => 'admins/passwords'
  }

  resources :articles do
    resources :comments, only: [:create]
  end


  get '/archives/:yyyymm', to: 'archives#show', as: :monthly_archive

  resources :categories

  root "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
