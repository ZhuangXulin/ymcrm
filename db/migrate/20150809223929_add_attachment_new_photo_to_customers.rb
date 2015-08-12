class AddAttachmentNewPhotoToCustomers < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.attachment :new_photo
    end
  end

  def self.down
    remove_attachment :customers, :new_photo
  end
end
