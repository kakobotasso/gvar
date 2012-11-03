class Interested < ActiveRecord::Base
  attr_accessible :email, :interest, :name, :phone, :situation

  def real_situation
  	Category::Interested::SITUATION.rassoc(situation)[0]
  end
end
