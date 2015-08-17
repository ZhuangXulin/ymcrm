class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.integer :mid    #药品编号
      t.string :name    #药品名称
      t.text :description #药品描述

      t.timestamps null: false
    end
  end
end
