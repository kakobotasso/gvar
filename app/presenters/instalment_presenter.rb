class InstalmentPresenter
  def initialize(list_instalments)
    @instalments = list_instalments
  end

  def partial
    if @instalments.size > 0
      {
        :partial => "shared/instalments",
        :locals => { :instalments => @instalments }
      }
    else
      {
        :partial => "shared/no_results"
      }
    end
  end

  def self.edit_path_of_release(object)
    @ret = I18n.t("activerecord.models.#{object.type.to_s.downcase}")
    "/financeiro/#{@ret.downcase.pluralize}/#{object.id}/editar"
  end
end
