class Nurse < ActiveRecord::Base
  self.per_page = 15
  
  #获取护士列表
  def self.get_nurse_list(page)
    Nurse.paginate(:page => page ,:per_page => per_page)
  end

end
