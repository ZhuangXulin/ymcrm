class AddIndexToTreatments < ActiveRecord::Migration
  def change
  	add_index :treatments, :cid   #增加cid为索引
  	add_index :treatments, :mid   #增加mid为索引
  end
end
