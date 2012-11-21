module ApplicationHelper
	def menu
		case self.controller_name.to_sym
			when :cursos, :turmas, :alunos, :interessados, :inscricoes then render '/shared/menu_courses.html.erb'
			when :clients, :providers, :services, :schedules then render '/shared/menu_services.html.erb'
			when :payments, :receipts then render '/shared/menu_financial.html.erb'
			when :users then render '/shared/menu_users.html.erb'
		end
	end
end
