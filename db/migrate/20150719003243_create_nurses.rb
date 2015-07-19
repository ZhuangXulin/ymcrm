class CreateNurses < ActiveRecord::Migration
  def change
    create_table :nurses do |t|
      t.integer :nid  #护士编号
      t.string :name  #护士姓名
      t.string :picture   #护士照片
      t.timestamps null: false
    end
  end
end
