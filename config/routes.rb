Depot::Application.routes.draw do
  resources :registrations do

    collection do
     match 'notification', :via => [:get, :post]
  end
end


  get "about_us/index"

  resources :abouts


  resources :posts do
    resources :comments
  end

resources :lessons do
 
  collection do
     match 'notification', :via => [:get, :post]
 
end

resources :registration

end

#lesson booking



  resources :coaches


#  devise_for :admins

  devise_for :users do
    resources :bookings
  end

  get "store/index"
  get "about_us/index"
   get "home/index"

 root :to => "home#index"
 
  resources :products
  
  match 'store/add_to_cart/:id' => 'store#add_to_cart', :as => :add_to_cart
  match 'store/add_to_cart/:id/empty_cart' => 'store#empty_cart', :as => :empty_cart
  match 'store/empty_cart' => 'store#empty_cart', :as => :empty_cart
  

  
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
