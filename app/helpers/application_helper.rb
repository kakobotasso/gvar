module ApplicationHelper
  def menu
    case self.controller_name.to_sym
    when :courses, :teams, :students, :interesteds, :registrations then render '/shared/menu_courses'
    when :clients, :providers, :services, :schedules then render '/shared/menu_services'
    when :payments, :receipts, :reports then render '/shared/menu_financial'
    when :users then render '/shared/menu_users'
    end
  end

  def date_to_view(date)
    date.strftime("%d/%m/%Y")
  end

end
