Rails.application.routes.draw do
  get 'members/create'

  get 'members/destroy'

  root 'users#main'

  post 'create' => 'users#create'

  post 'login' => 'sessions#login'

  get 'logout' => 'sessions#logout'
  
  get 'groups' => 'groups#index'

  post 'create_group' => 'groups#create'

  get 'groups/:id' => 'groups#show'

  post 'join_group' => 'members#create'

  delete 'leave_group' => 'members#destroy'

  delete 'destroy' => 'groups#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
