Rails.application.routes.draw do
  # get 'comments/create'
  # get 'comments/edit'
  # get 'comments/update'
  # get 'comments/destroy'
  root to: 'welcome#index'

  resources :articles do 

    resources :comments, only: [:create, :edit, :update, :destroy]
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
