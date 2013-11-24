Projectmule::Application.routes.draw do

    resources :phone_numbers


    resources :delivery_points


    resources :delivery_areas

    devise_for :users 
    
    get '/admin/users', :to => 'users#index', :as => :users
    post '/admin/users', :to => 'users#create'
    get '/admin/users/new', :to => 'users#new', :as => :new_user
    get '/admin/users/:id/edit', :to => 'users#edit', :as => :edit_user
    get '/admin/users/:id', :to => 'users#show', :as => :user
    put '/admin/users/:id', :to => 'users#update'
    delete '/admin/users/:id', :to => 'users#destroy'

    resources :vendors


    resources :menus


    resources :ingredients


    resources :items

    get '/cart', :to => 'cart#cart', :as => :cart

    post '/add_item/:item_to_add', :to => 'items#addItemToCart', :as => :add_item_to_cart

    post '/minus_item/:item_to_minus', :to => 'items#minusItemFromCart', :as => :minus_item_from_cart

    post '/remove_item/:item_to_remove', :to => 'items#removeItemFromCart', :as => :remove_item_from_cart

    root :to => 'main#home'

    # The priority is based upon order of creation:
    # first created -> highest priority.

    # Sample of regular route:
    #   match 'products/:id' => 'catalog#view'
    # Keep in mind you can assign values other than :controller and :action

    # Sample of named route:
    #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
    # This route can be invoked with purchase_url(:id => product.id)

    # Sample resource route (maps HTTP verbs to controller actions automatically):
    #   resources :products

    # Sample resource route with options:
    #   resources :products do
    #     member do
    #       get 'short'
    #       post 'toggle'
    #     end
    #
    #     collection do
    #       get 'sold'
    #     end
    #   end

    # Sample resource route with sub-resources:
    #   resources :products do
    #     resources :comments, :sales
    #     resource :seller
    #   end

    # Sample resource route with more complex sub-resources
    #   resources :products do
    #     resources :comments
    #     resources :sales do
    #       get 'recent', :on => :collection
    #     end
    #   end

    # Sample resource route within a namespace:
    #   namespace :admin do
    #     # Directs /admin/products/* to Admin::ProductsController
    #     # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end

    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.
    # root :to => 'welcome#index'

    # See how all your routes lay out with "rake routes"

    # This is a legacy wild controller route that's not recommended for RESTful applications.
    # Note: This route will make all actions in every controller accessible via GET requests.
    # match ':controller(/:action(/:id))(.:format)'
end
