class Nurse < ActiveRecord::Base
  self.per_page = 15
  # add paperclip 
  belongs_to :category
  has_attached_file :photo,
                    :styles => { :big => "600x600",
                    			 :medium => "300x300>",  
                                 :thumb => "100x100>" },
                    :url => "/nurse/:attachment/:id/:style/:basename.:extension",    
                    :path => ":rails_root/public/nurse/:attachment/:id/:style/:basename.:extension"
                    
  validates_attachment_presence :photo    
  validates_attachment_size :photo, :less_than => 5.megabytes    
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  #获取护士列表
  def self.get_nurse_list(page)
    Nurse.paginate(:page => page ,:per_page => per_page)
  end

  #获取全部的护士列表
  def self.get_all_nurse
    Nurse.all
  end
end
