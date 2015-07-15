class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :cid    #客户编号
      t.string :name    #客户姓名
      t.string :id_number    #身份证号码
      t.string :birthday    #生日
      t.integer :gender   #性别,0=男，1=女
      t.integer :marriage  #婚姻，0=已婚，1=未婚
      t.string :nationality #国籍
      t.string :sub_nationality    #民族
      t.string :email  #email地址
      t.integer :doctor_id#注射医生id
      t.integer :nurse_id #跟诊护士id
      t.string :occupation   #职业
      t.string :to_store_channel  #到店渠道
      t.string :special_history #特殊病史
      t.integer :pregnant  #是否怀孕,0:怀孕,1:未怀孕
      t.integer :blood_type  #血性,0:A,1:B,2:AB,3:O,4:未知
      t.string :operation_history  #手术史
      t.string :drug_allergy #服药史-药物过敏
      t.integer :medicine  #服药史-目前是否使用药物，0:未使用,1:使用
      t.string :beauty_therapy  #美容史-美疗类
      t.string :phototherapy  #美容史-光疗类
      t.string :hyaluronic_acid  #美容史-注射类-玻尿酸部位
      t.string :microcrystalline_porcelain  #美容史-注射类-微晶瓷部位
      t.string :other_parts  #美容史-注射类-其他部位
      t.string :plastic_part  #美容史-整形手术部位
      t.string :skin    #治疗需求-肤质
      t.string :wrinkle #治疗需求-皱纹
      t.string :blood_vessel  #治疗需求-血管
      t.string :pore #治疗需求-毛孔
      t.string :pigment   #治疗需求-色素
      t.string :figure  #治疗需求-体型
      t.string :other_info    #其他信息
      t.string :picture_url  #客户照片地址
      t.string :before_treatment_picture_url  #疗程前照片
      t.string :after_treatment_picture_url  #疗程后照片
      t.string :phone   #联系电话
      t.integer :consultant_id   #咨询师ID
      t.integer :channel_id   #渠道ID
      t.string :remarks  #备注
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
