Projectmule::Application.routes.draw do

  resources :orders


    resources :phone_numbers


    resources :delivery_points

    resources :delivery_areas do
        member do
            get 'menu'
        end
    end

    #get '/delivery_areas/:id',  :as => :Choose, :to => 'delivery_points#updateCustomer'
    get '/delivery_areas/:id/pts', :to => 'delivery_areas#pts', :as => :area_points

    resources :main
    post '/area_chosen', :to => 'main#goToMenu', :as => :area_chosen

    devise_for :users, :controllers => { :registrations => "users_registration"}

    get '/admin/users', :to => 'users#index', :as => :users
    post '/admin/users', :to => 'users#create'
    get '/admin/users/new', :to => 'users#new', :as => :new_user
    get '/admin/users/:id/edit', :to => 'users#edit', :as => :edit_user
    get '/admin/users/:id', :to => 'users#show', :as => :user
    put '/admin/users/:id', :to => 'users#update'
    delete '/admin/users/:id', :to => 'users#destroy'

    resources :vendors do
        member do
            get 'items'
        end
    end

    resources :menus


    resources :ingredients


    resources :items

    get '/cart', :to => 'cart#cart', :as => :cart

    post '/add_item/:item_to_add', :to => 'items#addItemToCart', :as => :add_item_to_cart

    post '/minus_item/:item_to_minus', :to => 'items#minusItemFromCart', :as => :minus_item_from_cart

    post '/remove_item/:item_to_remove', :to => 'items#removeItemFromCart', :as => :remove_item_from_cart

    post '/pay', :to => 'cart#pay', :as => :pay

    get '/order_receipt', :to => 'orders#receipt', :as => :order_receipt

    get '/account', :to => 'users#account', :as => :account

    get '/account/credit_cards', :to => 'credit_cards#index', :as => :edit_credit_cards

    get '/account/add_credit_card', :to => 'credit_cards#new', :as => :new_credit_card

    post '/account/add_credit_card', :to => 'credit_cards#create', :as => :create_credit_card

    post '/account/set_default_credit_card', :to => 'credit_cards#setDefault', :as => :set_default_credit_card

    get '/account/orders', :to => 'orders#user_orders', :as => :user_orders

    delete '/destroy_credit_card/:id', :to => 'credit_cards#destroy', :as => :destroy_credit_card

    post '/cart/change_credit_card', :to => 'credit_cards#changeCreditCard', :as => :change_credit_card

    get '/cart/change_credit_card', :to => 'credit_cards#creditCardSelection', :as => :credit_card_selection

    post '/cart/new_credit_card', :to => 'credit_cards#useNewCreditCard', :as => :use_new_credit_card

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
