class Customer < ActiveRecord::Base
  self.per_page = 15

  # add paperclip customer old_photo
  belongs_to :category
  has_attached_file :old_photo,
                    :styles => { :big => "600x600",
                    			 :medium => "300x300>",  
                                 :thumb => "100x100>" },
                    :default_url => "/default/:style/missing.jpg",             
                    :url => "/customer/:attachment/:id/:style/:basename.:extension",    
                    :path => ":rails_root/public/customer/:attachment/:id/:style/:basename.:extension"
                    
  validates_attachment_presence :old_photo unless :old_photo
  validates_attachment_size :old_photo, :less_than => 5.megabytes
  validates_attachment_content_type :old_photo, :content_type => ['image/jpeg', 'image/png']

  # add paperclip doctor new_photo
  belongs_to :category
  has_attached_file :new_photo,
                    :styles => { :big => "600x600",
                    			 :medium => "300x300>",  
                                 :thumb => "100x100>" },
                    :default_url => "/default/:style/missing.jpg",
                    :url => "/customer/:attachment/:id/:style/:basename.:extension",    
                    :path => ":rails_root/public/customer/:attachment/:id/:style/:basename.:extension"
                    
  validates_attachment_presence :new_photo unless :new_photo
  validates_attachment_size :new_photo, :less_than => 5.megabytes, :allow_blank => true
  validates_attachment_content_type :new_photo, :content_type => ['image/jpeg', 'image/png']
  
  
  #获取客户列表
  def self.get_customer_list(operator_id,search_key,page)
    #Customer.paginate_by_sql("select * from customers ",:page => page, :per_page => per_page)
    Customer.where("name like ?","%#{search_key}%").paginate(:page => page, :per_page => per_page)
  end

  #新增客户资料  
  def self.create(customer_info)
    Customer.new(
                  :cid => customer_info['cid'],  #客户编号
                  :name => customer_info['name'],  #客户姓名
                  :id_number => customer_info['id_number'],   #客户身份证号码
                  :birthday => customer_info['birthday'],   #客户生日
                  :gender => customer_info['gender'],   #性别
                  :marriage => customer_info['marriage'], #是否已婚
                  :phone => customer_info['phone'],    #联系电话
                  :sub_nationality => customer_info['sub_nationality'], #民族
                  :doctor_id => customer_info['doctor_id'],   #医生ID
                  :nurse_id => customer_info['nurse_id'],    #护士ID
                  :address => customer_info['address'],  #客户地址
                  :place_of_origin => customer_info['place_of_origin'], #客户籍贯
                  :course_content => customer_info['course_content'],  #疗程内容
                  :occupation => customer_info['occupation'],     #职业
                  :to_store_channel => customer_info['to_store_channel'],    #到店渠道
                  :special_history => customer_info['special_history'],    #特殊病史
                  :pregnant => customer_info['pregnant'],  #是否怀孕
                  :blood_type => customer_info['blood_type'],  #血型
                  :operation_history => customer_info['operation_history'], #手术史
                  :drug_allergy => customer_info['drug_allergy'],   #过敏药物
                  :medicine => customer_info['medicine'],   #当前使用的药物
                  :beauty_therapy => customer_info['beauty_therapy'],      #美疗类 
                  :phototherapy => customer_info['phototherapy'],      #光疗类
                  :hyaluronic_acid => customer_info['hyaluronic_acid'],      #注射类-玻尿酸
                  :microcrystalline_porcelain => customer_info['microcrystalline_porcelain'],        #注射类—微晶瓷
                  :other_parts => customer_info['other_parts'],        #注射类-其他
                  :plastic_part => customer_info['plastic_part'],        #整形手术
                  :old_photo => customer_info['old_photo'],        #治疗前照片
                  :new_photo => customer_info['new_photo'],         #治疗后照片
                  :beauty_therapy_text => customer_info['beauty_therapy_text'],   #美疗类其他
                  :phototherapy_text => customer_info[:phototherapy_text],   #光疗类其他
                  :hyaluronic_acid_text => customer_info['hyaluronic_acid_text'],    #玻尿酸部位
                  :microcrystalline_porcelain_text => customer_info['microcrystalline_porcelain_text'],   #微晶瓷部位
                  :other_parts_text => customer_info['other_parts_text'],    #其他部位
                  :plastic_part_text => customer_info['plastic_part_text'],   #整形手术部位
                  :skin_text => customer_info['skin_text'],     #肤质其他
                  :wrinkle_text => customer_info['wrinkle_text'],   #皱纹其他
                  :blood_vessel_text => customer_info['blood_vessel_text'],   #血管其他
                  :pore_text => customer_info['pore_text'],      #毛孔其他
                  :pigment_text => customer_info['pigment_text'],   #色素其他
                  :figure_text => customer_info['figure_text'],   #体型其他
                  :operator_id => customer_info['operator_id']   #操作者ID
                )

  end

  #获取客户详细信息
  def self.show(customer_id)
    customer_info = Customer.find(customer_id)

  end

  #获取客户总数
  def self.get_customer_count
    Customer.count()
  end

  #获取全部的客户列表
  def self.get_all_customer
    Customer.all
  end

end
