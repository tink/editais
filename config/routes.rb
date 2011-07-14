Editais::Application.routes.draw do
  root :to => "editais#index"

  resources :editais, :only => [:index, :show]

  resources :palavras_chave, :only => :show

  resources :empresas, :only => [:new, :create], :path_names => { :new => 'nova' } do
    collection do
      get :autenticar
      post :verificar
    end
  end

  resources :downloads, :only => [:create, :show]

  devise_for :users, :path => "usuarios", :path_names => { :sign_in => 'acessar', :sign_out => 'sair' }
  match 'admin' => 'admin/editais#index', :as => :user_root

  namespace :admin do
    resources :editais, :path_names => { :new => 'novo', :edit => 'editar' } do
      resources :documentos,
        :only => [:new, :edit, :create, :update, :destroy],
        :path_names => { :new => 'novo', :edit => 'editar'}
    end
      
    match "relatorios/downloads_por_edital/:id" => 'relatorios#downloads_por_edital', :as => :relatorio_downloads_por_edital
  end

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
