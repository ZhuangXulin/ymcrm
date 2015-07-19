class Doctor < ActiveRecord::Base
  self.per_page = 15
  
  #获取医生列表
  def self.get_doctor_list(page)
    Doctor.paginate(:page => page ,:per_page => per_page)
  end
end
