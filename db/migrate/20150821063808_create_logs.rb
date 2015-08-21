class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :operator_id    #操作员ID
      t.string :ip    #操作者IP
      t.string :type_of_action   #操作动作类型
      t.text :description   #描述
      t.timestamps null: false
    end
  end
end
