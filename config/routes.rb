Gvar::Application.routes.draw do

  root :to => "sessions#destroy"

  # VARIAVEL QUE ARMAZENA O CAMINHO PARA FUTURAS MUDANÇAS
  URL_FINANCEIRO  = "/financeiro"
  URL_SERVICOS    = "/servicos"
  URL_CLIENTES    = "/clientes"
  URL_PRESTADORES = "/prestadores"

  controller :financeiro do
    get  "#{URL_FINANCEIRO}", :action => :index, :as => :financeiro_index
    get  "#{URL_FINANCEIRO}/novo-pagamento", :action => :novo_pagamento, :as => :novo_pagamento
    get  "#{URL_FINANCEIRO}/relatorio", :action => :consultar
    post "#{URL_FINANCEIRO}/relatorio", :action => :relatorio
    get  "#{URL_FINANCEIRO}/pagar/:id", :action => :pagar, :as => :financeiro_pagar
    post "#{URL_FINANCEIRO}/pagar-parcela", :action => :pagar_parcela, :as => :financeiro_pagar_parcela
    get  "#{URL_FINANCEIRO}/criar-parcelas", :action => :create_instalments, :as => :financeiro_criar_parcelas
    get  "#{URL_FINANCEIRO}/lancamento/:id/editar", :action => :editar_lancamento, :as => :financeiro_editar_lancamento
    put  "#{URL_FINANCEIRO}/update-lancamento", :action => :update_lancamento, :as => :financeiro_update_lancamento
  end

  get "cursos/index"
  get "assessoria/index"

  controller :sessions do
    get  "/login", :action => :new, :as => :login
    post "/login", :action => :create, :as => false
    get  "/logout", :action => :destroy, :as => :logout
    post "/new_password", :action => :new_password, :as => :new_password
    get  "/lembrar-senha", :action => :lembrar_senha, :as => :lembrar_senha
  end

  controller :dashboard do
    get  "/dashboard", :action => :index, :as => :dashboard
  end

  controller :release do
    post   "/release", :action => :create, :as => :releases
    put    "/release", :action => :update
    delete "/release", :action => :destroy
  end

  resources :users
  get  "/alterar-senha",   :controller => :users, :action => :alterar_senha, :as => :alterar_senha
  post "/update-password", :controller => :users, :action => :update_password, :as => :update_password

  controller :clients do
    get    "#{URL_CLIENTES}",            :action => :index, :as => :clients
    post   "#{URL_CLIENTES}",            :action => :create
    get    "#{URL_CLIENTES}/novo",       :action => :new, :as => :new_client
    get    "#{URL_CLIENTES}/buscar",     :action => :search, :as => :search_clients
    get    "#{URL_CLIENTES}/:id/editar", :action => :edit, :as => :edit_client
    get    "#{URL_CLIENTES}/:id",        :action => :show, :as => :client
    put    "#{URL_CLIENTES}/:id",        :action => :update
    delete "#{URL_CLIENTES}/:id",        :action => :destroy
  end

  controller :services do
    get    "#{URL_SERVICOS}",            :action => :index, :as => :services
    post   "#{URL_SERVICOS}",            :action => :create
    get    "#{URL_SERVICOS}/novo",       :action => :new, :as => :new_service
    get    "#{URL_SERVICOS}/buscar",     :action => :search, :as => :search_services
    get    "#{URL_SERVICOS}/:id/editar", :action => :edit, :as => :edit_service
    get    "#{URL_SERVICOS}/:id",        :action => :show, :as => :service
    put    "#{URL_SERVICOS}/:id",        :action => :update
    delete "#{URL_SERVICOS}/:id",        :action => :destroy
  end

  controller :providers do
    get    "#{URL_PRESTADORES}",            :action => :index, :as => :providers
    post   "#{URL_PRESTADORES}",            :action => :create
    get    "#{URL_PRESTADORES}/novo",       :action => :new, :as => :new_provider
    get    "#{URL_PRESTADORES}/buscar",     :action => :search, :as => :search_providers
    get    "#{URL_PRESTADORES}/:id/editar", :action => :edit, :as => :edit_provider
    get    "#{URL_PRESTADORES}/:id",        :action => :show, :as => :provider
    put    "#{URL_PRESTADORES}/:id",        :action => :update
    delete "#{URL_PRESTADORES}/:id",        :action => :destroy
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
