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

    resources :categories

#    get "users/filter/:scope" => "users#show", as: :filtered_users

     resources :users 
     get 'signup' => 'users#new'
     post 'users_create' => 'users#create'
     get 'users/general'
     get 'users/notifications'
     get 'users/help'
     get 'timecard' => 'users#show'     
    

     resource :session
     get 'signin' => 'sessions#new'

    get 'settings/general'
    get 'settings/notifications'
    get 'settings/help'
	
end
