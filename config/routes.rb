KMatch::Application.routes.draw do

  devise_for :users
  ActiveAdmin.routes(self)
  root to: 'pages#index'
  # Routes for statics pages
  get '/community', to: 'pages#community'
  get '/community_details', to: 'pages#community_details'
  get '/academics', to: 'pages#academics'
  get '/vision', to: 'pages#vision'
  get '/sign_up', to: 'pages#sign_up'
  get '/sign_up2', to: 'pages#sign_up2'
  get '/profile-admin', to: 'pages#profile-admin'
  get '/profile-current', to: 'pages#profile-current'
  get '/profile-prospect', to: 'pages#profile-prospect'
  get '/profile-leader', to: 'pages#profile-leader'
  get '/prospective-intro', to: 'pages#prospective-intro'
  get '/connect-page', to: 'pages#connect-page'
  get '/connection-accepted', to: 'pages#connection-accepted'
  get '/students-search', to: 'pages#students-search'
  get '/dashboard', to: 'pages#dashboard'
  get '/alumni', to: 'pages#alumni'

  # Routes for the Home resource:
  # CREATE
  get '/homes/new', controller: 'homes', action: 'new', as: 'new_home'
  post '/homes', controller: 'homes', action: 'create', as: 'homes'

  # READ
  get '/homes', controller: 'homes', action: 'index'
  get '/homes/:id', controller: 'homes', action: 'show', as: 'home'

  # UPDATE
  get '/homes/:id/edit', controller: 'homes', action: 'edit', as: 'edit_home'
  patch '/homes/:id', controller: 'homes', action: 'update'

  # DELETE
  delete '/homes/:id', controller: 'homes', action: 'destroy'
  #------------------------------

  
  # Routes for the Match resource:
    # CREATE
  get '/matches/new', controller: 'matches', action: 'new', as: 'new_match'
  post '/matches', controller: 'matches', action: 'create', as: 'matches'

  # READ
  get '/matches', controller: 'matches', action: 'index'
  get '/matches/:id', controller: 'matches', action: 'show', as: 'match'

  # UPDATE
  get '/matches/:id/edit', controller: 'matches', action: 'edit', as: 'edit_match'
  patch '/matches/:id', controller: 'matches', action: 'update'

  # DELETE
  delete '/matches/:id', controller: 'matches', action: 'destroy'
  #------------------------------

  # Routes for the Country resource:
  # CREATE
  get '/countries/new', controller: 'countries', action: 'new', as: 'new_country'
  post '/countries', controller: 'countries', action: 'create', as: 'countries'

  # READ
  get '/countries', controller: 'countries', action: 'index'
  get '/countries/:id', controller: 'countries', action: 'show', as: 'country'

  # UPDATE
  get '/countries/:id/edit', controller: 'countries', action: 'edit', as: 'edit_country'
  patch '/countries/:id', controller: 'countries', action: 'update'

  # DELETE
  delete '/countries/:id', controller: 'countries', action: 'destroy'
  #------------------------------

  # Routes for the Preference resource:
  # CREATE
  get '/preferences/new', controller: 'preferences', action: 'new', as: 'new_preference'
  post '/preferences', controller: 'preferences', action: 'create', as: 'preferences'

  # READ
  get '/preferences', controller: 'preferences', action: 'index'
  get '/preferences/:id', controller: 'preferences', action: 'show', as: 'preference'

  # UPDATE
  get '/preferences/:id/edit', controller: 'preferences', action: 'edit', as: 'edit_preference'
  patch '/preferences/:id', controller: 'preferences', action: 'update'

  # DELETE
  delete '/preferences/:id', controller: 'preferences', action: 'destroy'
  #------------------------------

  # Routes for the Before_function resource:
  # CREATE
  get '/before_functions/new', controller: 'before_functions', action: 'new', as: 'new_before_function'
  post '/before_functions', controller: 'before_functions', action: 'create', as: 'before_functions'

  # READ
  get '/before_functions', controller: 'before_functions', action: 'index'
  get '/before_functions/:id', controller: 'before_functions', action: 'show', as: 'before_function'

  # UPDATE
  get '/before_functions/:id/edit', controller: 'before_functions', action: 'edit', as: 'edit_before_function'
  patch '/before_functions/:id', controller: 'before_functions', action: 'update'

  # DELETE
  delete '/before_functions/:id', controller: 'before_functions', action: 'destroy'
  #------------------------------

  # Routes for the After_function resource:
  # CREATE
  get '/after_functions/new', controller: 'after_functions', action: 'new', as: 'new_after_function'
  post '/after_functions', controller: 'after_functions', action: 'create', as: 'after_functions'

  # READ
  get '/after_functions', controller: 'after_functions', action: 'index'
  get '/after_functions/:id', controller: 'after_functions', action: 'show', as: 'after_function'

  # UPDATE
  get '/after_functions/:id/edit', controller: 'after_functions', action: 'edit', as: 'edit_after_function'
  patch '/after_functions/:id', controller: 'after_functions', action: 'update'

  # DELETE
  delete '/after_functions/:id', controller: 'after_functions', action: 'destroy'
  #------------------------------

  # Routes for the After_industry resource:
  # CREATE
  get '/after_industries/new', controller: 'after_industries', action: 'new', as: 'new_after_industry'
  post '/after_industries', controller: 'after_industries', action: 'create', as: 'after_industries'

  # READ
  get '/after_industries', controller: 'after_industries', action: 'index'
  get '/after_industries/:id', controller: 'after_industries', action: 'show', as: 'after_industry'

  # UPDATE
  get '/after_industries/:id/edit', controller: 'after_industries', action: 'edit', as: 'edit_after_industry'
  patch '/after_industries/:id', controller: 'after_industries', action: 'update'

  # DELETE
  delete '/after_industries/:id', controller: 'after_industries', action: 'destroy'
  #------------------------------

  # Routes for the Before_industry resource:
  # CREATE
  get '/before_industries/new', controller: 'before_industries', action: 'new', as: 'new_before_industry'
  post '/before_industries', controller: 'before_industries', action: 'create', as: 'before_industries'

  # READ
  get '/before_industries', controller: 'before_industries', action: 'index'
  get '/before_industries/:id', controller: 'before_industries', action: 'show', as: 'before_industry'

  # UPDATE
  get '/before_industries/:id/edit', controller: 'before_industries', action: 'edit', as: 'edit_before_industry'
  patch '/before_industries/:id', controller: 'before_industries', action: 'update'

  # DELETE
  delete '/before_industries/:id', controller: 'before_industries', action: 'destroy'
  #------------------------------

  # Routes for the Function resource:
  # CREATE
  get '/functions/new', controller: 'functions', action: 'new', as: 'new_function'
  post '/functions', controller: 'functions', action: 'create', as: 'functions'

  # READ
  get '/functions', controller: 'functions', action: 'index'
  get '/functions/:id', controller: 'functions', action: 'show', as: 'function'

  # UPDATE
  get '/functions/:id/edit', controller: 'functions', action: 'edit', as: 'edit_function'
  patch '/functions/:id', controller: 'functions', action: 'update'

  # DELETE
  delete '/functions/:id', controller: 'functions', action: 'destroy'
  #------------------------------

  # Routes for the Industry resource:
  # CREATE
  get '/industries/new', controller: 'industries', action: 'new', as: 'new_industry'
  post '/industries', controller: 'industries', action: 'create', as: 'industries'

  # READ
  get '/industries', controller: 'industries', action: 'index'
  get '/industries/:id', controller: 'industries', action: 'show', as: 'industry'

  # UPDATE
  get '/industries/:id/edit', controller: 'industries', action: 'edit', as: 'edit_industry'
  patch '/industries/:id', controller: 'industries', action: 'update'

  # DELETE
  delete '/industries/:id', controller: 'industries', action: 'destroy'
  #------------------------------

  # Routes for the Program resource:
  # CREATE
  get '/programs/new', controller: 'programs', action: 'new', as: 'new_program'
  post '/programs', controller: 'programs', action: 'create', as: 'programs'

  # READ
  get '/programs', controller: 'programs', action: 'index'
  get '/programs/:id', controller: 'programs', action: 'show', as: 'program'

  # UPDATE
  get '/programs/:id/edit', controller: 'programs', action: 'edit', as: 'edit_program'
  patch '/programs/:id', controller: 'programs', action: 'update'

  # DELETE
  delete '/programs/:id', controller: 'programs', action: 'destroy'
  #------------------------------

  # Routes for the Interest resource:
  # CREATE
  get '/interests/new', controller: 'interests', action: 'new', as: 'new_interest'
  post '/interests', controller: 'interests', action: 'create', as: 'interests'

  # READ
  get '/interests', controller: 'interests', action: 'index'
  get '/interests/:id', controller: 'interests', action: 'show', as: 'interest'

  # UPDATE
  get '/interests/:id/edit', controller: 'interests', action: 'edit', as: 'edit_interest'
  patch '/interests/:id', controller: 'interests', action: 'update'

  # DELETE
  delete '/interests/:id', controller: 'interests', action: 'destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/users/new', controller: 'users', action: 'new', as: 'new_user'
  post '/users', controller: 'users', action: 'create', as: 'users'

  # READ
  get '/users', controller: 'users', action: 'index'
  get '/users/:id', controller: 'users', action: 'show', as: 'user'
  get '/profile', to: "users#profile"

  # UPDATE
  get '/users/:id/edit', controller: 'users', action: 'edit', as: 'edit_user'
  patch '/users/:id', controller: 'users', action: 'update'

  # DELETE
  delete '/users/:id', controller: 'users', action: 'destroy'
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
