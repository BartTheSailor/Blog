Rails.application.routes.draw do
  # get 'pictures/index'
  # get 'pictures/new'
  # get 'pictures/create'
  # get 'pictures/edit'
  # get 'pictures/update'
  # get 'pictures/show'
  # get 'pictures/destroy'
  devise_for :users
  # get 'comments/create'
  # get 'comments/edit'
  # get 'comments/update'
  # get 'comments/destroy'
  root to: 'welcome#index'

  resources :articles do 

    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :pictures do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
    #, only: [:index, :show, :edit, :update, :create, :destroy, :new] -mamy 7 akcji,
    # nie musimy pisać żadnej z only
    
  end

  get '/weather' => 'weather#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
