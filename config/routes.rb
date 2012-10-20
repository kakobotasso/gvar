Gvar::Application.routes.draw do

  root :to => "sessions#destroy"

  # VARIAVEL QUE ARMAZENA O CAMINHO PARA FUTURAS MUDANÇAS
  URL_FINANCEIRO = "/financeiro"

  controller :financeiro do
    get "#{URL_FINANCEIRO}", :action => :index, :as => :financeiro_index
    get "#{URL_FINANCEIRO}/novo-pagamento", :action => :novo_pagamento, :as => :novo_pagamento
  end

  get "assessoria/index"
  get "servicos/index"

  controller :cursos do
    get "/cursos", :action => :index, :as => :courses                   # cursos_path
    get "/cursos/new", :action => :new, :as => :courses_new
    post "/cursos", :action => :create, :as => :courses                  # cursos_path
    get "/cursos/:id", :action => :show, :as => :courses_show
    get "/cursos/:id/edit", :action => :edit, :as => :courses_edit
    put "cursos/:id", :action => :update, :as => :courses_update
    get "cursos/:id/cancel", :action => :cancel, :as => :courses_cancel
    #match "/cursos/:id/", :action => :show, :as => :cursos_detalhe
    #match "/cursos/:id/edit", :action => :edit, :as => :cursos_editar
  end

  controller :turmas do
    get "/turmas", :action => :index, :as => :teams                   
    get "/turmas/novo", :action => :new, :as => :teams_new
    post "/turmas", :action => :create, :as => :teams                 
    get "/turmas/:id", :action => :show, :as => :teams_show
    get "/turmas/:id/editar", :action => :edit, :as => :teams_edit
    put "/turmas/:id", :action => :update, :as => :teams_update
    get "/turmas/:id/cancelar", :action => :cancel, :as => :teams_cancel
    get "/turmas/:id/planejamento", :action => :planning, :as => :teams_planning
  end

  controller :alunos do
    get "/alunos", :action => :index, :as => :students                   
    get "/alunos/novo", :action => :new, :as => :students_new
    post "/alunos", :action => :create, :as => :students                 
    get "/alunos/:id", :action => :show, :as => :students_show
    get "/alunos/:id/editar", :action => :edit, :as => :students_edit
    put "/alunos/:id", :action => :update, :as => :students_update
    get "/alunos/:id/cancelar", :action => :cancel, :as => :students_cancel
  end

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
