Rails.application.routes.draw do
  # get 'payments/new'

  # get 'payments/create'

  resources :games do
    resources :payments, only: [:new, :create]
  end

  # get 'games/index'

  # get 'games/show'

  # get 'games/new'

  # get 'games/edit'

  # get 'games/create'

  # get 'games/update'

  # get 'games/destroy'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
