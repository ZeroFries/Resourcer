Resourcer::Application.routes.draw do
  namespace :api do
    resources :sources, only: [:show]
    resources :topics, only: [:show]
    resources :bookmarks, only: [:index, :show, :create]
    resources :completed_sources, only: [:show, :create, :destroy]
    resources :current_learning_paths, only: [:show, :create]
  end

  resources :topics do
    resources :skills, only: [:new] do
      resources :sources, only: [:new, :create]
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :bookmarks, only: [:index, :destroy]

  namespace :admin do
    resources :sources, only: [:index, :edit, :update, :destroy]
  end

  root to: "topics#index"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"

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
