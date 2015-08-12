class AddAttachmentOldPhotoToCustomers < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.attachment :old_photo
    end
  end

  def self.down
    remove_attachment :customers, :old_photo
  end
end
