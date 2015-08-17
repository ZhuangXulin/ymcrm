class Medicine < ActiveRecord::Base
  self.per_page = 15

  #获取药品列表
  def self.get_medicine_list(search_key,page)
    Medicine.where("name like ?","%#{search_key}%").paginate(:page => page ,:per_page => per_page)
  end


  #获取全部的药品信息列表
  def self.get_all_medicine
    Medicine.all
  end
end
