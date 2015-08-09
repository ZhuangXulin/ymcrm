class RemovePictureFromDoctors < ActiveRecord::Migration
  def change
  	remove_column :doctors, :picture
  end
end
