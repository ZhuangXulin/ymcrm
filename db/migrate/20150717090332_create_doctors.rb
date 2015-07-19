class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.integer :did  #医生编号
      t.string :name #医生姓名
      t.string :picture  #医生照片
      t.timestamps null: false
    end
  end
end
