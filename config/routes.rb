Kijovo::Application.routes.draw do


    root "welcome#index"
    
      get 'welcome/about'
      get 'welcome/terms'
    #  get 'welcome/contact'
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



     get "users/image/:id/before" => "users#image", scope: "before"
     get "users/image/:id/future" => "users#image", scope: "future"
     get "users/image/:id/unknown" => "users#image", scope: "unknown"
     resources :users
     get 'users/image/:id' => 'users#image', as: :users_image
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
