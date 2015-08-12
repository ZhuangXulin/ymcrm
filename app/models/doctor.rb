class Doctor < ActiveRecord::Base
  self.per_page = 15
  # add paperclip doctor photo
  belongs_to :category
  has_attached_file :photo,
                    :styles => { :big => "600x600",
                    			 :medium => "300x300>",  
                                 :thumb => "100x100>" },
                    :url => "/doctor/:attachment/:id/:style/:basename.:extension",    
                    :path => ":rails_root/public/doctor/:attachment/:id/:style/:basename.:extension"
                    
  validates_attachment_presence :photo    
  validates_attachment_size :photo, :less_than => 5.megabytes    
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  #获取医生列表
  def self.get_doctor_list(page)
    Doctor.paginate(:page => page ,:per_page => per_page)
  end

  #获取全部的医生列表
  def self.get_all_doctor
    Doctor.all
  end
end
