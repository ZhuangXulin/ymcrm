class Treatment < ActiveRecord::Base
  self.per_page = 15

  #获取疗程信息列表
  def self.get_treatment_list(search_key,page)
    #Treatment.where("cid like ?","%#{search_key}%").paginate(:page => page ,:per_page => per_page)
    Treatment.paginate_by_sql("SELECT  t.*,(select name from customers where cid=t.cid) as cname,(select name from medicines where mid=t.mid) as mname FROM `treatments` as t WHERE (cid like '%#{search_key}%')",:page => page ,:per_page => per_page)
  end

  #获取疗程的详细信息
  def self.show(treatment_id)
  	Treatment.find_by_sql("SELECT  t.*,(select name from customers where cid=t.cid) as cname,(select name from medicines where mid=t.mid) as mname FROM `treatments` as t WHERE t.id = #{treatment_id}")
  end

  #获取疗程数量
  def self.get_treatment_count
    Treatment.count()
  end

  def self.get_all_income
    Treatment.sum("actual_income")
  end
end
