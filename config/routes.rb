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
    get "/cursos/novo", :action => :new, :as => :courses_new
    post "/cursos/", :action => :create, :as => :courses                  # cursos_path
    get "/cursos/:id", :action => :show, :as => :courses_show
    get "/cursos/:id/editar", :action => :edit, :as => :courses_edit
    put "cursos/:id", :action => :update, :as => :courses_update
    get "cursos/:id/cancelar", :action => :cancel, :as => :courses_cancel
    #match "/cursos/:id/", :action => :show, :as => :cursos_detalhe
    #match "/cursos/:id/edit", :action => :edit, :as => :cursos_editar
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
end
