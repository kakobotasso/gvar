Gvar::Application.routes.draw do

  root :to => "sessions#destroy"

  # VARIAVEL QUE ARMAZENA O CAMINHO PARA FUTURAS MUDANÇAS
  URL_FINANCEIRO   = "/financeiro"
  URL_SERVICOS     = "/servicos"
  URL_CLIENTES     = "/clientes"
  URL_PRESTADORES  = "/prestadores"
  URL_PAGAMENTOS   = "/pagamentos"
  URL_RECEBIMENTOS = "/recebimentos"
  URL_AGENDA       = "/agenda-de-servicos"

  controller :payments do
    get  "#{URL_FINANCEIRO}#{URL_PAGAMENTOS}",                       :action => :index,          :as => :financeiro_index
    get  "#{URL_FINANCEIRO}#{URL_PAGAMENTOS}/novo-pagamento",        :action => :new,            :as => :novo_pagamento
    post "#{URL_FINANCEIRO}#{URL_PAGAMENTOS}/pagar-parcela",         :action => :pay_instalment, :as => :financeiro_pagar_parcela
    get  "#{URL_FINANCEIRO}#{URL_PAGAMENTOS}/criar-parcelas",        :action => :create,         :as => :financeiro_criar_parcelas
    put  "#{URL_FINANCEIRO}#{URL_PAGAMENTOS}/update-lancamento",     :action => :update,         :as => :financeiro_update_lancamento
    get  "#{URL_FINANCEIRO}#{URL_PAGAMENTOS}/search",                :action => :search
    get  "#{URL_FINANCEIRO}#{URL_PAGAMENTOS}/lancamento/:id/editar", :action => :edit,           :as => :financeiro_editar_lancamento
    get  "#{URL_FINANCEIRO}#{URL_PAGAMENTOS}/pagar/:id",             :action => :pay,            :as => :financeiro_pagar
  end

  get "assessoria/index"
  get "servicos/index"

  controller :cursos do
    get "/cursos", :action => :index, :as => :courses                   # cursos_path
    get "/cursos/novo", :action => :new, :as => :courses_new
    post "/cursos/", :action => :create, :as => :courses                  # cursos_path
    get "/cursos/:id", :action => :show, :as => :courses_show
    get "/cursos/:id/editar", :action => :edit, :as => :courses_edit
    put "cursos/:id", :action => :update, :as => :courses_update
    get "cursos/:id/cancelar", :action => :cancel, :as => :courses_cancel
  end

  controller :turmas do
    get "/turmas", :action => :index, :as => :teams
    get "/turmas/novo", :action => :new, :as => :teams_new
    post "/turmas", :action => :create, :as => :teams
    post "/turmas/encontro", :action => :save_meeting, :as => :save_meeting
    get "/turmas/salva-atividade", :action => :save_activity, :as => :save_activity
    get "/turmas/ver-atividades", :action => :see_activity, :as => :see_activity
    get "/turmas/:id", :action => :show, :as => :teams_show
    get "/turmas/:id/editar", :action => :edit, :as => :teams_edit
    put "/turmas/:id", :action => :update, :as => :teams_update
    get "/turmas/:id/cancelar", :action => :cancel, :as => :teams_cancel
    get "/turmas/:id/concluir", :action => :conclude, :as => :teams_conclude
    get "/turmas/:id/planejamento", :action => :planning, :as => :teams_planning
  end

  controller :alunos do
    get "/alunos", :action => :index, :as => :students
    get "/alunos/novo", :action => :new, :as => :students_new
    post "/alunos", :action => :create
    get "/alunos/:id", :action => :show, :as => :students_show
    get "/alunos/:id/editar", :action => :edit, :as => :students_edit
    put "/alunos/:id", :action => :update
    get "/alunos/:id/cancelar", :action => :cancel, :as => :students_cancel
  end

  controller :interessados do
    get "/interessados", :action => :index, :as => :interested
    get "/interessados/novo", :action => :new, :as => :interested_new
    post "/interessados", :action => :create, :as => :interested
    get "/interessados/:id", :action => :show, :as => :interested_show
    get "/interessados/:id/editar", :action => :edit, :as => :interested_edit
    get "/interessados/:id/historico", :action => :history, :as => :interested_history
    put "/interessados/:id/historico/salvar", :action => :save_history, :as => :interested_contact_save
    put "/interessados/:id", :action => :update, :as => :interested_update
  end

  controller :inscricoes do
    get "/inscricoes", :action => :index, :as => :registration
    get "/inscricoes/novo", :action => :new, :as => :registration_new
    post "/inscricoes", :action => :create
    get "/inscricoes/:id", :action => :show, :as => :registration_show
    get "/inscricoes/:id/editar", :action => :edit, :as => :registration_edit
    put "/inscricoes/:id", :action => :update
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

  controller :schedules do
    get    "#{URL_AGENDA}",            :action => :index,  :as => :schedules
    post   "#{URL_AGENDA}",            :action => :create
    get    "#{URL_AGENDA}/novo",       :action => :new,    :as => :new_schedule
    get    "#{URL_AGENDA}/buscar",     :action => :search, :as => :search_schedules
    get    "#{URL_AGENDA}/:id/editar", :action => :edit,   :as => :edit_schedule
    get    "#{URL_AGENDA}/:id",        :action => :show,   :as => :schedule
    put    "#{URL_AGENDA}/:id",        :action => :update
    delete "#{URL_AGENDA}/:id",        :action => :destroy
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
