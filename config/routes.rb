Kijovo::Application.routes.draw do


    root "welcome#index"
    
      get 'welcome/about'
      get 'welcome/terms'
    # get 'welcome/contact'
      get 'welcome/rights'
      get 'welcome/data'
      get 'welcome/cookies'
      get 'welcome/rules'
      get 'welcome/privacy'
      get 'welcome/principles'

      match '/contacts', to: 'contacts#new', via: 'get'
      resources "contacts", only: [:new, :create]


    get "products/filter/:scope" => "products#index", as: :filtered_products
    resources :products do
      resources :clocks
    end



     resources :users
     get 'users/image/:id' => 'users#image', as: :users_image
     get "users/image/:id/before" => "users#image", scope: "before", as: :users_image_before
     get "users/image/:id/future" => "users#image", scope: "future", as: :users_image_future
     get "users/image/:id/unknown" => "users#image", scope: "unknown", as: :users_image_unknown
     get "users/:id/before" => "users#show", scope: "before", as: :users_show_before
     get "users/:id/future" => "users#show", scope: "future", as: :users_show_future
     get "users/:id/unknown" => "users#show", scope: "unknown", as: :users_show_unknown
     get 'signup' => 'users#new'
     post 'users_create' => 'users# create'
     get 'users/tutorial/:id' => 'users#tutorial', as: :users_tutorial


    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'
    
    resources :password_resets

     resource :session
     get 'signin' => 'sessions#new'

     get 'settings/general'
     get 'settings/notifications'
  #  get 'settings/help'


     resources :categories

end
