class AddOperatorIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :operator_id, :integer   #操作的管理员
  end
end
