Rails.application.routes.draw do

  # Sidekiq admin UI
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # root "course_dates#index"
  root "pages#home_page"

  resources :courses do
    resources :course_dates do
      member do
        get 'course_details'
      end
      resources :tickets do
        resources :entries
      end
    end
  end

  resources :tickets do
    resources :payments
  end

  resources :course_dates do
    resources :bookings
  end

  resources :payments

  resources :plans
  resources :subscriptions



  devise_for :users

  get 'users/course_providers', :to => 'users#course_providers_index'

  resources :users, :only => [:show, :edit, :update, :index] do
    # member do
    #   get 'dashboard'
    # end
    # resources :dashboard, :only => [:index] do
    #   # resources :courses , :only => [:show]
    #   get "course_details" => 'dashboard#course_details'
    # end
  end

  resource :dashboard do
    get 'transactions'
    get 'weeks_transactions_csv'
    get 'weeks_bookings_csv'
    get 'months_transactions_csv'
    get 'all_transactions_csv'
    get 'bookings'
    get 'withdraw'
  end



  get '/about', :to => 'pages#about'
  get '/faq', :to => 'pages#faq'
  get '/sales_and_refunds', :to => 'pages#sales_and_refunds'
  get '/offer', :to => 'pages#offer'
  get '/home', :to => 'pages#home_page'
  get '/how_it_works', :to => 'pages#how_it_works'
  get '/examples', :to => 'pages#examples'


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
