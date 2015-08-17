class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.integer :cid     #客户编号
      t.text :treatment_content  #项目内容
      t.integer :mid   #药品ID
      t.string :medicine_number   #药品数量
      t.string :gift   #赠品
      t.string :price  #价格
      t.string :discount  #折扣
      t.string :discounted_price  #折扣后价格
      t.string :actual_income   #实际收入
      t.text :remark  #备注
      t.timestamps null: false
    end
  end
end
