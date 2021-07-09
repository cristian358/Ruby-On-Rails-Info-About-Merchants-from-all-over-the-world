Rails.application.routes.draw do
  resources :companies do
    collection {post :import }
  end  

#   devise_scope :user do
#     get '/' => 'devise/sessions#new'
# end


# devise_for :users, skip: [:sessions]
# as :user do
#   get 'login', to: 'devise/sessions#new', as: :new_user_session
#   get 'signup', to: 'devise/registrations#new', as: :new_user_registration
#   post 'login', to: 'home#index', as: :user_session
#   get 'logout', to: 'sessions#destroy', as: :destroy_user_session
#   get 'forgot', to: 'devise/passwords#new', as: :forgot_password
# end


devise_for :users, path: '', path_names: { sign_in: 'login',sign_up: 'signup', sign_out: 'logout'}

  # devise_for :users
  resources :friends
  get 'home/about'
  get '/404', to: 'errors#not_found'
  
  root 'articles#index'

    # resources: 'articles#index'
   resources :articles
  # resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
