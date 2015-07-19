class Customer < ActiveRecord::Base
  self.per_page = 15
  # 婚姻状况
  :marriage_already
  :marriage_no
  
  
  #获取客户列表
  def self.get_customer_list(operator_id,page)
    Customer.paginate_by_sql("select * from customers ",:page => page, :per_page => per_page)
  end
  
  
end
