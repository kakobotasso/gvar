# *-* encoding: UTF-8 *-*
module Status
  #
  # @status   = Status::FINANCIAL
  #
  # select_tag :status_id, options_for_select(@status)
  #
  # ira gerar:
  #
  # <select id="status_id" name="status_id"><option value="0">Pendente</option>
  #   <option value="1">Quitado</option>
  #   <option value="2">Cancelado</option>
  #   <option value="3">Recebido</option>
  # </select>
  FINANCIAL = [
    ["Pendente", 0],
    ["Quitado",  1],
    ["Cancelado",2],
    ["Recebido", 3]
  ]

  TEAMS = [
    ["Em andamento", 0],
    ["Concluido", 1],
    ["Cancelado", 2]
  ]
end