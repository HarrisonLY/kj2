Kijovo::Application.routes.draw do

    root "welcome#index"
    
      get 'welcome/about'
      get 'welcome/terms'
      get 'welcome/contact'
      get 'welcome/rights'
      get 'welcome/data'
      get 'welcome/cookies'
      get 'welcome/rules'
      get 'welcome/privacy'
      get 'welcome/principles'


    get "products/filter/:scope" => "products#index", as: :filtered_products
    resources :products do
      resources :clocks
    end



     resources :users  
     get 'users/image/:id' => 'users#image', as: :users_image
     get 'signup' => 'users#new'
     post 'users_create' => 'users#create'
    

     resource :session
     get 'signin' => 'sessions#new'

     get 'settings/general'
     get 'settings/notifications'
     get 'settings/help'


     resources :categories

end
