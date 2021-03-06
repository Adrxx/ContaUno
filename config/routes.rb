Rails.application.routes.draw do

  resources :groups, path: 'admin/groups', path_names: { new: 'nuevo', edit: 'editar' }, module: 'c4' do
    resource :feedback, only: [:show, :update, :create]
  end
  
  root 'static_pages#landing'
  get '/contacto' => 'static_pages#contacto', as: 'contacto'
  get '/pagos' => 'static_pages#pagos', as: 'pagos'
  get '/compra-exitosa' => 'static_pages#pago_exitoso', as: 'pago_exitoso'
  get '/profesores' =>  redirect('/admin'), as: 'profesor'

  get '/tareas' => 'static_pages#tareas', as: 'tareas'
  post '/tareas' => 'static_pages#create_tareas'

  patch 'admin/contacto' => 'c4/admin#contact' 
  get 'admin/contacto' => 'c4/admin#contact', as: 'contact' 

  mount C4::Engine => "/admin"

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
