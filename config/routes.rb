Gvar::Application.routes.draw do

  root :to => "sessions#destroy"

  # VARIAVEL QUE ARMAZENA O CAMINHO PARA FUTURAS MUDANÇAS
  URL_FINANCEIRO    = "/financeiro"
  URL_SERVICOS      = "/servicos"
  URL_CLIENTES      = "/clientes"
  URL_PRESTADORES   = "/prestadores"
  URL_PAGAMENTOS    = "/pagamentos"
  URL_RECEBIMENTOS  = "/recebimentos"
  URL_AGENDA        = "/agenda-de-servicos"
  URL_TURMAS        = "/turmas"
  URL_CURSOS        = "/cursos"
  URL_ALUNOS        = "/alunos"
  URL_INTERESSADOS  = "/interessados"
  URL_INSCRICOES    = "/inscricoes"

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

  controller :receipts do
    get  "#{URL_FINANCEIRO}#{URL_RECEBIMENTOS}",                       :action => :index,          :as => :receipts
    get  "#{URL_FINANCEIRO}#{URL_RECEBIMENTOS}/novo-recebimento",      :action => :new,            :as => :new_receipt
    post "#{URL_FINANCEIRO}#{URL_RECEBIMENTOS}/pagar-parcela",         :action => :pay_instalment, :as => :financeiro_pagar_parcela
    get  "#{URL_FINANCEIRO}#{URL_RECEBIMENTOS}/criar-parcelas",        :action => :create,         :as => :financeiro_criar_parcelas
    put  "#{URL_FINANCEIRO}#{URL_RECEBIMENTOS}/update-lancamento",     :action => :update,         :as => :financeiro_update_lancamento
    get  "#{URL_FINANCEIRO}#{URL_RECEBIMENTOS}/search",                :action => :search
    get  "#{URL_FINANCEIRO}#{URL_RECEBIMENTOS}/lancamento/:id/editar", :action => :edit,           :as => :financeiro_editar_lancamento
    get  "#{URL_FINANCEIRO}#{URL_RECEBIMENTOS}/pagar/:id",             :action => :pay,            :as => :financeiro_pagar
  end
  get "assessoria/index"
  get "servicos/index"

  controller :courses do
    get    "#{URL_CURSOS}",                :action => :index, :as => :courses
    post   "#{URL_CURSOS}",                :action => :create
    get    "#{URL_CURSOS}/novo",           :action => :new, :as => :new_course
    get    "#{URL_CURSOS}/buscar",         :action => :search, :as => :search_courses
    get    "#{URL_CURSOS}/:id/editar",     :action => :edit, :as => :edit_course
    get    "#{URL_CURSOS}/:id/cancelar",   :action => :cancel, :as => :cancel_course
    get    "#{URL_CURSOS}/:id",            :action => :show, :as => :course
    put    "#{URL_CURSOS}/:id",            :action => :update
  end

  controller :teams do
    get    "#{URL_TURMAS}",                  :action => :index, :as => :teams
    post   "#{URL_TURMAS}",                  :action => :create
    get    "#{URL_TURMAS}/novo",             :action => :new, :as => :new_team
    get    "#{URL_TURMAS}/buscar",           :action => :search, :as => :search_teams
    post   "#{URL_TURMAS}/encontro",         :action => :save_meeting, :as => :save_meeting
    get    "#{URL_TURMAS}/salva-atividade",  :action => :save_activity, :as => :save_activity
    get    "#{URL_TURMAS}/ver-atividades",   :action => :see_activity, :as => :see_activity
    get    "#{URL_TURMAS}/:id/cancelar",     :action => :cancel, :as => :teams_cancel
    get    "#{URL_TURMAS}/:id/concluir",     :action => :conclude, :as => :teams_conclude
    get    "#{URL_TURMAS}/:id/planejamento", :action => :planning, :as => :teams_planning
    get    "#{URL_TURMAS}/:id/editar",       :action => :edit, :as => :edit_team
    get    "#{URL_TURMAS}/:id",              :action => :show, :as => :team
    put    "#{URL_TURMAS}/:id",              :action => :update
    delete "#{URL_TURMAS}/:id",              :action => :destroy
  end

  controller :students do
    get    "#{URL_ALUNOS}",                :action => :index, :as => :students
    post   "#{URL_ALUNOS}",                :action => :create
    get    "#{URL_ALUNOS}/novo",           :action => :new, :as => :new_student
    get    "#{URL_ALUNOS}/buscar",         :action => :search, :as => :search_students
    get    "#{URL_ALUNOS}/:id/editar",     :action => :edit, :as => :edit_student
    get    "#{URL_ALUNOS}/:id/cancelar",   :action => :cancel, :as => :cancel_course
    get    "#{URL_ALUNOS}/:id",            :action => :show, :as => :student
    put    "#{URL_ALUNOS}/:id",            :action => :update
    delete "#{URL_ALUNOS}/:id",            :action => :destroy
  end

  controller :interesteds do
    get    "#{URL_INTERESSADOS}",                       :action => :index, :as => :interesteds
    post   "#{URL_INTERESSADOS}",                       :action => :create
    get    "#{URL_INTERESSADOS}/novo",                  :action => :new, :as => :new_interested
    get    "#{URL_INTERESSADOS}/buscar",                :action => :search, :as => :search_students
    get    "#{URL_INTERESSADOS}/:id",                   :action => :show, :as => :interested
    get    "#{URL_INTERESSADOS}/:id/historico",         :action => :history, :as => :interested_history
    put    "#{URL_INTERESSADOS}/:id/historico/salvar",  :action => :save_history, :as => :interested_contact_save
    get    "#{URL_INTERESSADOS}/:id/editar",            :action => :edit, :as => :edit_interested
    get    "#{URL_INTERESSADOS}/:id/cancelar",          :action => :cancel, :as => :cancel_course
    put    "#{URL_INTERESSADOS}/:id",                   :action => :update
    delete "#{URL_INTERESSADOS}/:id",                   :action => :destroy
  end

  controller :registrations do
    get    "#{URL_INSCRICOES}",                    :action => :index,           :as => :registrations
    post   "#{URL_INSCRICOES}",                    :action => :create
    get    "#{URL_INSCRICOES}/escolher-aluno",     :action => :choose_student,  :as => :choose_student
    get    "#{URL_INSCRICOES}/buscar",             :action => :search,          :as => :search_registrations
    get    "#{URL_INSCRICOES}/buscar-alunos",      :action => :search_students, :as => :search_students
    post   "#{URL_INSCRICOES}/confirmacao"  ,      :action => :confirm,         :as => :confirm_registration
    get    "#{URL_INSCRICOES}/escolher-turma/:id", :action => :choose_team,     :as => :choose_team
    get    "#{URL_INSCRICOES}/:id/editar",     :action => :edit,            :as => :edit_registration
    get    "#{URL_INSCRICOES}/:id",            :action => :show,            :as => :registration
    put    "#{URL_INSCRICOES}/:id",            :action => :update
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
