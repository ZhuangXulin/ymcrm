class AddAddressToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :address, :string   #客户地址
  end
end
