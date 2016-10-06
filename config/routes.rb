Rails.application.routes.draw do
  root to: "people#index"

  get 'people/index', as: 'people-index'
  #
  # get 'people/show/:id', 'people#show', as: 'people-show'
  #
  # get 'people/edit'
  #
  post 'people/create' => 'people#create', as: "createperson"

  get 'people/new' => "people#new", as: "newperson"
  #
  # get 'people/update'
  #
  # get 'people/destroy'

  get 'tasks/:person_id/index' => "tasks#index", as: "index"

  get 'tasks/:person_id/new/'=> "tasks#new", as: "new"

  post 'tasks/:person_id/create' => 'tasks#create', as: "create"

  # get 'tasks/update'
  get "tasks/:id/edit" => "tasks#edit", as: "edit"

  patch "tasks/:id/update/" => "tasks#update", as: "update"

  get 'tasks/show/:id/' => 'tasks#show', as: 'show'

  delete 'tasks/:id/destroy' => "tasks#destroy", as: "delete"

  patch 'tasks/:id/completion_status/:person_id' => 'tasks#completion_status', as: "complete"

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
