class AddSometextToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :beauty_therapy_text, :string  #美疗类其他
  	add_column :customers, :phototherapy_text, :string    #光疗类其他
  	add_column :customers, :hyaluronic_acid_text, :string  #玻尿酸部位
  	add_column :customers, :microcrystalline_porcelain_text, :string #微晶瓷部位
  	add_column :customers, :other_parts_text, :string    #其他部位
  	add_column :customers, :plastic_part_text, :string    #整形手术部位
  	add_column :customers, :skin_text, :string   #肤质其他
  	add_column :customers, :wrinkle_text, :string   #皱纹其他
  	add_column :customers, :blood_vessel_text, :string   #血管其他
  	add_column :customers, :pore_text, :string    #毛孔其他
  	add_column :customers, :pigment_text, :string    #色素其他
  	add_column :customers, :figure_text, :string   #体型其他
  end 
end
