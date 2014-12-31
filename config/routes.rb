CmsAdmin::Application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root :to => 'pages#show', :id => '1'

  # CMS root
  get 'admin' => "admin/dashboard#index"
  get 'admin/pages/:id/posts' => "admin/pages#show_posts"

  get 'users/sign_up' => "admin/admin#index"

  devise_for :users

  resources :pages
  resources :posts
  get '/:id' => "pages#show", :as => "pagelink"

  namespace :admin do
    resources :pages do
      collection do
        get 'move_up'
        get 'move_down'
        get 'publish'
        get 'destroy'
        get 'remove'
      end
    end
    resources :posts do
      collection do
        get 'move_up'
        get 'move_down'
        get 'new_post_for'
        get 'publish'
        get 'destroy'
        get 'remove'
      end
    end
    resources :users do
      collection do
        get 'move_up'
        get 'move_down'
        get 'publish'
        get 'destroy'
        get 'remove'
      end
    end
  end

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
