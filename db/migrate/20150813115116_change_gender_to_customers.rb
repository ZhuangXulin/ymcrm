class ChangeGenderToCustomers < ActiveRecord::Migration
  def change
  	remove_column :customers, :gender
  	remove_column :customers, :marriage
  	remove_column :customers, :pregnant
  	remove_column :customers, :blood_type
  	remove_column :customers, :medicine

  	add_column :customers, :gender, :string
  	add_column :customers, :marriage, :string
  	add_column :customers, :pregnant, :string
  	add_column :customers, :blood_type, :string
  	add_column :customers, :medicine, :string
  end
end
