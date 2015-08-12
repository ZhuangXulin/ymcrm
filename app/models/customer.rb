class Customer < ActiveRecord::Base
  self.per_page = 15

  # add paperclip customer old_photo
  belongs_to :category
  has_attached_file :old_photo,
                    :styles => { :big => "600x600",
                    			 :medium => "300x300>",  
                                 :thumb => "100x100>" },
                    :url => "/customer/:attachment/:id/:style/:basename.:extension",    
                    :path => ":rails_root/public/customer/:attachment/:id/:style/:basename.:extension"
                    
  validates_attachment_presence :old_photo    
  validates_attachment_size :old_photo, :less_than => 5.megabytes    
  validates_attachment_content_type :old_photo, :content_type => ['image/jpeg', 'image/png']

  # add paperclip doctor new_photo
  belongs_to :category
  has_attached_file :new_photo,
                    :styles => { :big => "600x600",
                    			 :medium => "300x300>",  
                                 :thumb => "100x100>" },
                    :url => "/customer/:attachment/:id/:style/:basename.:extension",    
                    :path => ":rails_root/public/customer/:attachment/:id/:style/:basename.:extension"
                    
  validates_attachment_presence :new_photo
  validates_attachment_size :new_photo, :less_than => 5.megabytes    
  validates_attachment_content_type :new_photo, :content_type => ['image/jpeg', 'image/png']

  
  
  #获取客户列表
  def self.get_customer_list(operator_id,page)
    Customer.paginate_by_sql("select * from customers ",:page => page, :per_page => per_page)
  end
  
  def self.create()

  	
  	
  	puts '------------------'
    puts '客户编号:'+customer_params[:cid]
    puts '客户姓名:'+customer_params[:name]
    puts '身份证号码:'+customer_params[:id_number]
    puts '生日:'+customer_params[:birthday]
    puts '性别:'+customer_params[:gender]
    puts '是否已婚:'+params[:customer][:marriage].to_s
    puts '联系电话:'+customer_params[:phone]
    puts '民族:'+customer_params[:sub_nationality]
    puts '医师ID:'+customer_params[:doctor_id]
    puts '护士ID:'+customer_params[:nurse_id]
    puts '地址:'+customer_params[:address]
    puts '籍贯:'+customer_params[:place_of_origin]
    puts '疗程内容:'+customer_params[:course_content]
    puts '职业'+customer_params[:occupation].to_s
    puts '到店渠道:'+customer_params[:to_store_channel].to_s
    puts '特殊病史:'+customer_params[:special_history].to_s
    puts '是否怀孕:'+customer_params[:pregnant].to_s
    puts '血型:'+customer_params[:blood_type].to_s
    puts '手术史:'+customer_params[:operation_history]
    puts '是否对药物过敏:'+customer_params[:drug_allergy]
    puts '是否使用药物:'+customer_params[:medicine]
    puts '美疗类:'+customer_params[:beauty_therapy].to_s
    puts '美疗类其他内容:'+params[:beauty_therapy_text].to_s
    puts '光疗类:'+customer_params[:phototherapy].to_s
    puts '光疗类其他内容:'+params[:phototherapy_text].to_s
    puts '注射类-玻尿酸:'+customer_params[:hyaluronic_acid].to_s
    puts '注射类-玻尿酸部位:'+params[:hyaluronic_acid_text].to_s
    puts '注射类—微晶瓷:'+customer_params[:microcrystalline_porcelain].to_s
    puts '注射类-微晶瓷部位:'+params[:microcrystalline_porcelain_text].to_s
    puts '其他:'+customer_params[:other_parts].to_s
    puts '其他部位:'+params[:other_parts_text].to_s
    puts '整形手术:'+customer_params[:plastic_part].to_s
    puts '整形手术部位:'+params[:plastic_part_text].to_s
    puts '治疗需求-肤质:'+customer_params[:skin].to_s
    puts '治疗需求-肤质其他:'+params[:skin_text].to_s
    puts '治疗需求-皱纹:'+customer_params[:wrinkle].to_s
    puts '治疗需求-皱纹其他:'+params[:wrinkle_text].to_s
    puts '治疗需求-血管:'+customer_params[:blood_vessel].to_s
    puts '治疗需求-血管其他'+params[:blood_vessel_text].to_s
    puts '治疗需求-毛孔:'+customer_params[:pore].to_s
    puts '治疗需求-毛孔其他:'+params[:pore_text].to_s
    puts '治疗需求-色素:'+customer_params[:pigment].to_s
    puts '治疗需求-色素其他:'+params[:pigment_text].to_s
    puts '治疗需求-体型:'+customer_params[:figure].to_s
    puts '治疗需求-体型其他:'+params[:figure_text].to_s
    puts '其他:'+customer_params[:other_info]
    puts '------------------'
  end
end
