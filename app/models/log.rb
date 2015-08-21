class Log < ActiveRecord::Base
  
  def self.log(operator_id,ip,type_of_action,description)
  	Log.create(:operator_id => operator_id,:ip => ip,:type_of_action => type_of_action,:description => description)
  end
end
