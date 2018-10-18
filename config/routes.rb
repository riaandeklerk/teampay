Rails.application.routes.draw do
  get 'welcome/index'

  resources :games do
    #resources :payments, only: [:new, :create]
    #resources :players do
    get 'players', to: 'games#players'
    get 'new_player', to: 'games#new_player'
    post 'add_player', to: 'games#add_player'
    post 'save_new_player', to: 'games#save_new_player'
    #end
  end

  root :to => 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/') # TODO: Bad page
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
