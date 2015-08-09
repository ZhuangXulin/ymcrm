class RemovePictureFromNurses < ActiveRecord::Migration
  def change
  	remove_column :nurses, :picture
  end
end
