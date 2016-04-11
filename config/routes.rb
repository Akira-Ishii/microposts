Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  get   'edit'  , to: 'users#edit'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy, :edit, :update]
end
