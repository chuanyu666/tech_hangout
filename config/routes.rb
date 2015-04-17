Rails.application.routes.draw do

  get 'signup' => 'users#signup', :as => 'signup'
  get 'login' => 'users#login', :as => 'login'
  delete 'logout' => 'users#logout', :as => 'logout'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'page#welcome'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
    get '/about' => 'page#about'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # issues
    # get 'issues/new' => 'issues#new'
    # get 'issues' => 'issues#index', :as => 'issues'
    # get 'issues/:id' => 'issues#show', :as => 'issue' 
    # get 'issues/:id/edit' => 'issues#edit', :as => 'edit_issue'
    # delete 'issues/:id' => 'issues#destroy'
    # patch 'issues/:id' => 'issues#update'
    # post '/issues' => 'issues#create'
    resources :issues
    resources :users, only: [:create]
  # comments
    resources :comments, only: [:create]
    post 'create_login_session' => 'users#create_login_session'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
