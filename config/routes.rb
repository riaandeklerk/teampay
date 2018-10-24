Rails.application.routes.draw do
  get 'welcome/index'

  resources :games do
    #resources :payments, only: [:new, :create]
    #resources :players do
    get 'players', to: 'games#players'
    get 'new_player', to: 'games#new_player'
    post 'add_player', to: 'games#add_player'
    post 'remove_player', to: 'games#remove_player'
    post 'save_new_player', to: 'games#save_new_player'
    #end
  end
  
  resource :games do
    post 'add_game_player_payment', to: 'add_game_player_payment'
  end

  resources :payments

  root :to => 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/') # TODO: Bad page
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
