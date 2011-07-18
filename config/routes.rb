Editais::Application.routes.draw do
  root :to => "editais#index"

  resources :editais, :only => [:index, :show] do
    collection do
      get :buscar
    end
  end

  resources :downloads, :only => [:create, :show]
  resources :palavras_chave, :only => :show
  resources :empresas, :only => [:new, :create], :path_names => { :new => 'nova' } do
    collection do
      get :autenticar
      post :verificar
    end
  end

  devise_for :users, :path => "usuarios", :path_names => { :sign_in => 'acessar', :sign_out => 'sair' }
  match 'admin' => 'admin/editais#index', :as => :user_root

  namespace :admin do
    resources :editais, :path_names => { :new => 'novo', :edit => 'editar' } do
      resources :documentos,
        :only => [:new, :edit, :create, :update, :destroy],
        :path_names => { :new => 'novo', :edit => 'editar'}
    end
      
    match "relatorios/downloads_por_edital/:id" => 'relatorios#downloads_por_edital', :as => :relatorio_downloads_por_edital

    get "configuracoes/editar_senha", :as => :editar_senha
    put "configuracoes/alterar_senha", :as => :alterar_senha
  end
end
